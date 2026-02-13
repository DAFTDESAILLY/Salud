📄 Documento de Requerimientos  
Agua – Advanced Beverage Management

Versión: 2.3  
Proyecto: Agua – Sistema Personal de Optimización Física  
Arquitectura: Flutter \+ Riverpod \+ Isar (Offline-first)

1️⃣ Objetivo

Extender el sistema de bebidas inteligentes para permitir:

Estadísticas por tipo de bebida

Gráfica de consumo por categoría

Configuración manual de coeficientes

Activación/desactivación de bebidas

Sin recalcular registros históricos.

2️⃣ Alcance

Incluye:

Nueva colección BeverageConfig

Nueva lógica dinámica de coeficientes

Nueva sección en Settings

Nueva pestaña en Statistics

Providers adicionales

No incluye:

Recalcular registros históricos

Sincronización en nube

Eliminación física de bebidas del sistema

3️⃣ Cambios en Modelo de Datos  
3.1 Nueva Colección: BeverageConfig

Ubicación:

lib/features/hydration/models/beverage\_config.dart

Campos requeridos:

Campo	Tipo	Descripción  
id	Id	AutoIncrement  
type	String (unique)	Identificador interno  
coefficient	double	Coeficiente de hidratación  
isEnabled	bool	Si la bebida está activa  
updatedAt	DateTime	Última modificación  
3.2 Valores Iniciales (Default Seed)

Si no existen configuraciones al iniciar app, crear:

type	coefficient	isEnabled  
water	1.0	true  
tea	0.9	true  
juice	0.95	true  
soda	0.85	true  
coffee	0.80	true  
smoothie	0.70	true  
4️⃣ Lógica de Negocio  
4.1 Registro de Nueva Bebida

Al crear un HydrationLog:

Buscar BeverageConfig por type

Obtener coefficient

Calcular:

effectiveAmountMl \= amountMl \* coefficient

Guardar ambos valores en HydrationLog

4.2 Registros Históricos

Regla oficial:

Los registros anteriores NO se modifican.

Cambios de coeficiente solo afectan registros nuevos.

Esto preserva integridad histórica.

4.3 Desactivación de Bebidas

Si isEnabled \== false:

No aparece en selector

No elimina datos históricos

No altera estadísticas pasadas

5️⃣ Estadísticas por Tipo de Bebida  
5.1 Agrupación

Agrupar HydrationLog por:

beverageType

Calcular:

Total ml reales

Total ml efectivos

% del total semanal

5.2 Nueva Pestaña en Statistics

Tabs:

\[ General \] \[ Por Bebida \]

5.3 Visualización

Gráfica recomendada:

Barras horizontales

Colores consistentes por bebida

Mostrar porcentaje \+ total ml

Ejemplo:

Café — 1200ml (15%)  
Agua — 6500ml (70%)

6️⃣ UI – Settings

Nueva sección:

🥤 Beverage Management

Para cada bebida:

Icono

Nombre

Slider coeficiente (0.5 – 1.2)

Switch ON/OFF

6.1 Requisitos de UI

Dark theme consistente

Cards redondeadas (16px)

Guardado inmediato

Feedback visual al cambiar valor

7️⃣ Providers Nuevos

Requeridos:

beverageConfigProvider

beverageStatsProvider

Actualizar:

hydration\_logs\_provider

todayTotalIntakeProvider

8️⃣ Migración Técnica

Después de agregar modelo:

flutter pub run build\_runner build \--delete-conflicting-outputs

En entorno de desarrollo, base puede limpiarse si necesario.

9️⃣ Verificación  
Manual Tests

Cambiar coeficiente de café a 0.5  
→ Nuevo café 200ml debe sumar 100ml

Desactivar soda  
→ No aparece en selector

Revisar estadísticas  
→ Agrupación correcta

Verificar logs antiguos  
→ No cambian valores

🔟 Impacto Arquitectónico

No requiere:

Nuevas dependencias externas

Backend

Cambios en DailyHydrationGoal

Sí requiere:

Nueva colección Isar

Actualización de lógica de registro

Nuevos providers

Nueva sección UI

1️⃣1️⃣ Criterios de Aceptación

La feature se considera completa cuando:

Se pueden editar coeficientes

Se pueden desactivar bebidas

Nuevos registros aplican coeficiente dinámico

Estadísticas muestran agrupación correcta

Registros históricos permanecen intactos

UI mantiene estándar Modern Fitness

🎯 Resultado Final

Después de v2.3, Agua tendrá:

Sistema configurable dinámico

Analítica avanzada por bebida

Persistencia inteligente

Integridad histórica preservada

Nivel profesional listo para expansión futura  

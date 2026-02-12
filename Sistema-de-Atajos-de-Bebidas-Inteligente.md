---

# **📄 Documento de Requerimientos**

## **Feature: Sistema de Atajos de Bebidas Inteligente**

Versión: 2.2  
Proyecto: Agua – Sistema Personal de Optimización Física

---

# **1️⃣ Objetivo**

Permitir registrar diferentes tipos de bebidas desde el botón principal del Dashboard, aplicando un coeficiente de hidratación distinto según el tipo de bebida.

Esto busca:

* Mejorar experiencia de usuario  
* Aumentar precisión del cálculo  
* Elevar nivel fitness/profesional de la app  
* Permitir estadísticas futuras por tipo de bebida

---

# **2️⃣ Alcance**

Incluye:

* UI de selección de bebida  
* Selección de tamaño  
* Cálculo de hidratación efectiva  
* Persistencia en base de datos  
* Compatibilidad con sistema actual de estadísticas

No incluye:

* Sincronización en nube  
* Edición retroactiva de bebida  
* Migraciones complejas multi-esquema

---

# **3️⃣ Cambios en Modelo de Datos**

## **3.1 Modificación de HydrationLog**

Modelo actual:

amountMl  
timestamp

Nuevo modelo requerido:

amountMl  
effectiveAmountMl  
timestamp  
beverageType

---

## **3.2 Nuevos Campos**

### **beverageType (String o Enum)**

Valores permitidos:

* water  
* coffee  
* tea  
* juice  
* soda  
* smoothie

---

### **effectiveAmountMl (int)**

Representa la cantidad real que se suma al progreso diario.

Ejemplo:

250 ml café → 200 ml efectivos

---

# **4️⃣ Coeficientes de Hidratación**

| Bebida | Coeficiente |
| ----- | ----- |
| Agua | 1.00 |
| Té | 0.90 |
| Jugo | 0.95 |
| Refresco | 0.85 |
| Café | 0.80 |
| Batido | 0.70 |

---

# **5️⃣ Lógica de Cálculo**

Al registrar bebida:

effectiveAmount \= amountMl \* coefficient

El progreso diario debe usar:

SUM(effectiveAmountMl)

NO usar amountMl directamente para progreso.

---

# **6️⃣ Requerimientos Funcionales**

---

## **RF-01 – Modal de Selección**

Al presionar FAB principal:

Debe abrir un BottomSheet con:

* Grid de bebidas  
* Íconos representativos  
* Estilo dark fitness

---

## **RF-02 – Selección de Tamaño**

Después de elegir bebida:

Mostrar opciones:

* Pequeño (250 ml)  
* Mediano (350 ml)  
* Grande (500 ml)  
* Personalizado

---

## **RF-03 – Registro**

Al confirmar:

* Guardar HydrationLog con:  
  * amountMl  
  * effectiveAmountMl  
  * beverageType  
  * timestamp

---

## **RF-04 – Actualización Inmediata**

El dashboard debe:

* Recalcular progreso  
* Animar círculo  
* Actualizar mensaje motivacional

---

## **RF-05 – Estadísticas**

La gráfica semanal debe:

* Basarse en effectiveAmountMl  
* Mantener compatibilidad con DailyHistoryData

---

# **7️⃣ Requerimientos de UI**

---

## **7.1 Bottom Sheet**

* Fondo oscuro (\#1E293B)  
* Bordes redondeados 24  
* Animación slide-up  
* Grid 2 columnas

---

## **7.2 Diseño de Bebidas**

Cada bebida debe mostrar:

* Ícono  
* Nombre  
* Pequeño texto con % hidratación

Ejemplo:

☕ Café  
80% hidratación

---

## **7.3 Feedback Visual**

Al seleccionar bebida:

* Highlight azul  
* Micro animación scale  
* Haptic feedback ligero

---

# **8️⃣ Requerimientos Técnicos**

---

## **8.1 Migración Isar**

Requiere:

* Actualizar HydrationLog  
* Ejecutar build\_runner  
* Eliminar conflicting outputs

Comando:

flutter pub run build\_runner build \--delete-conflicting-outputs

---

## **8.2 Compatibilidad Retroactiva**

Logs antiguos:

* No tienen beverageType  
* No tienen effectiveAmountMl

Solución:

Si effectiveAmountMl \== null:  
→ usar amountMl como 100%

---

# **9️⃣ Impacto en Arquitectura**

No requiere:

* Nuevas colecciones  
* Nuevos servicios externos  
* Cambios en notificaciones

Sí requiere:

* Actualización de lógica de cálculo  
* Actualización de providers  
* Actualización de Dashboard

---

# **🔟 Criterios de Aceptación**

La feature se considera completa cuando:

* Se puede seleccionar bebida  
* Se puede elegir tamaño  
* Se aplica coeficiente correctamente  
* Progreso refleja amount efectivo  
* Estadísticas funcionan sin errores  
* Logs antiguos siguen funcionando

---

# **1️⃣1️⃣ Futuras Expansiones**

Posibles mejoras:

* Estadísticas por tipo de bebida  
* Gráfica de consumo por categoría  
* Configurar coeficientes manualmente  
* Desactivar bebidas específicas

---

# **1️⃣2️⃣ Resultado Esperado**

La app debe sentirse:

* Más profesional  
* Más científica  
* Más fitness real  
* Más diferenciada de apps básicas

---


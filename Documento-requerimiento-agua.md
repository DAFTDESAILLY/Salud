📄 DOCUMENTO DE REQUERIMIENTOS TÉCNICOS  
Proyecto: Sistema Personal de Optimización Física \- Módulo Hidratación  
Versión: 1.0  
Fecha: Febrero 2026  
Estado: Aprobado para desarrollo

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

\#\# 1\. INFORMACIÓN DEL PROYECTO

\#\#\# 1.1 Propósito  
Desarrollar una aplicación móvil multiplataforma que calcule, registre y evalúe la hidratación diaria del usuario basándose en estándares científicos reconocidos, con funcionamiento 100% offline y arquitectura modular para futuras expansiones.

\#\#\# 1.2 Alcance  
\*\*Incluido en v1.0:\*\*  
\- Configuración de perfil de usuario  
\- Cálculo automático científico de meta de hidratación  
\- Registro manual de consumo de agua  
\- Dashboard de progreso diario  
\- Historial semanal  
\- Edición manual de meta  
\- Persistencia local offline

\*\*Excluido de v1.0:\*\*  
\- Backend/sincronización en nube  
\- Integración con wearables  
\- Notificaciones inteligentes avanzadas  
\- Módulos de rendimiento o actividad avanzada  
\- Múltiples usuarios

\#\#\# 1.3 Usuarios objetivo  
\- Usuario individual (uso personal)  
\- Personas conscientes de su salud física  
\- Atletas y deportistas amateur  
\- Personas que usan suplementación (creatina)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

\#\# 2\. STACK TECNOLÓGICO

\#\#\# 2.1 Framework y lenguaje  
\- \*\*Framework:\*\* Flutter 3.x (última versión stable)  
\- \*\*Lenguaje:\*\* Dart  
\- \*\*Plataformas:\*\* Android / iOS

\#\#\# 2.2 Dependencias principales  
\`\`\`yaml  
dependencies:  
  flutter\_riverpod: ^2.x  
  isar: ^3.x  
  isar\_flutter\_libs: ^3.x  
  path\_provider: ^2.x

dev\_dependencies:  
  isar\_generator: ^3.x  
  build\_runner: ^2.x

### **2.3 Gestión de estado**

* **Riverpod 2.x**  
  * Providers para lógica de negocio  
  * StateNotifierProvider para estados complejos  
  * FutureProvider para carga asíncrona

### **2.4 Persistencia**

* **Isar 3.x**  
  * Base de datos local NoSQL  
  * Tipado fuerte  
  * Alto rendimiento  
  * Soporte nativo para índices

### **2.5 Justificación técnica**

* **Flutter:** Multiplataforma con performance nativa  
* **Riverpod:** Gestión de estado moderna, testeable, sin BuildContext  
* **Isar:** Velocidad superior a Hive/SQLite en móviles, schemas tipados, sin necesidad de JSON

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## **3\. ARQUITECTURA DE SOFTWARE**

### **3.1 Estructura de carpetas**

lib/  
├── core/  
│   ├── database/  
│   │   └── isar\_service.dart  
│   ├── models/  
│   │   └── user\_profile.dart  
│   └── utils/  
│       ├── validators.dart  
│       └── date\_helpers.dart  
│  
├── features/  
│   └── hydration/  
│       ├── models/  
│       │   ├── hydration\_log.dart  
│       │   └── hydration\_settings.dart  
│       ├── services/  
│       │   └── hydration\_calculator\_service.dart  
│       ├── providers/  
│       │   ├── profile\_provider.dart  
│       │   ├── hydration\_logs\_provider.dart  
│       │   └── hydration\_settings\_provider.dart  
│       ├── screens/  
│       │   ├── onboarding\_screen.dart  
│       │   ├── dashboard\_screen.dart  
│       │   ├── history\_screen.dart  
│       │   └── settings\_screen.dart  
│       └── widgets/  
│           ├── progress\_indicator.dart  
│           ├── quick\_add\_buttons.dart  
│           └── log\_list\_item.dart  
│  
├── main.dart

### **3.2 Patrón arquitectónico**

**Arquitectura modular pragmática** (no Clean Architecture estricta)

**Razones:**

* App personal sin backend  
* Una sola fuente de datos (local)  
* Evitar sobreingeniería (usecases, repositories abstractos, mappers)  
* Facilitar desarrollo rápido  
* Arquitectura escalable para futuro backend

**Capas:**

1. **Presentación:** Screens \+ Widgets  
2. **Lógica:** Providers \+ Services  
3. **Datos:** Models \+ Database  
4. **Core:** Utilidades compartidas

### **3.3 Flujo de datos**

UI (Widgets)  
    ↓  
Providers (Riverpod)  
    ↓  
Services (Lógica de negocio)  
    ↓  
Database (Isar)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## **4\. MODELOS DE DATOS**

### **4.1 UserProfile**

@collection  
class UserProfile {  
  Id id \= Isar.autoIncrement;  
  late int age;              // 12-80 años  
  late String sex;           // 'male' | 'female'  
  late double weight;        // 30-250 kg  
  late String activityLevel; // 'sedentary' | 'moderate' | 'high'  
  late double exerciseHours; // 0-4 horas/día  
  late bool usesCreatine;    // true | false  
  late DateTime createdAt;  
  late DateTime updatedAt;  
}

**Validaciones:**

* Edad: 12-80 años  
* Peso: 30-250 kg  
* Horas ejercicio: 0-4 horas/día  
* Sex: valores permitidos 'male' o 'female'  
* ActivityLevel: 'sedentary', 'moderate', 'high'

### **4.2 HydrationLog**

@collection  
class HydrationLog {  
  Id id \= Isar.autoIncrement;  
  late DateTime timestamp;   // Fecha y hora exacta  
  late int amountMl;         // Cantidad en ml  
    
  @Index()  
  late DateTime date;        // Solo fecha (para búsquedas)  
}

**Índice:**

* Campo `date` indexado para consultas rápidas por día

### **4.3 HydrationSettings**

@collection  
class HydrationSettings {  
  Id id \= Isar.autoIncrement;  
  late int recommendedGoalMl; // Meta calculada científicamente  
  late int activeGoalMl;      // Meta activa (puede ser personalizada)  
  late bool isCustomGoal;     // true si usuario editó manualmente  
  late DateTime updatedAt;  
}

**Lógica:**

* `recommendedGoalMl`: Se recalcula automáticamente al cambiar perfil  
* `activeGoalMl`: Es la meta que se muestra al usuario  
* `isCustomGoal`: Indica si el usuario ha modificado la meta manualmente

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## **5\. LÓGICA DE NEGOCIO**

### **5.1 Cálculo de hidratación (Base científica)**

**Referencias:**

* EFSA (European Food Safety Authority)  
* IOM (Institute of Medicine)  
* ACSM (American College of Sports Medicine)  
* ISSN (International Society of Sports Nutrition)

**Fórmula:**

Meta recomendada \= Base \+ Ejercicio \+ Creatina

Donde:  
  Base \= peso (kg) × ml/kg según actividad  
  Ejercicio \= horas × 600 ml  
  Creatina \= 300 ml (si usa) o 0 ml (si no usa)

**Tabla de ml/kg según actividad:**

| Nivel | ml/kg |
| ----- | ----- |
| Sedentario | 30 |
| Moderado | 35 |
| Alto | 40 |

**Ejemplo:**

Usuario:  
\- Peso: 75 kg  
\- Actividad: Moderado  
\- Ejercicio: 1.5 horas/día  
\- Creatina: Sí

Cálculo:  
  Base \= 75 × 35 \= 2,625 ml  
  Ejercicio \= 1.5 × 600 \= 900 ml  
  Creatina \= 300 ml  
    
  Total \= 2,625 \+ 900 \+ 300 \= 3,825 ml (\~3.8 L)

### **5.2 Estados de cumplimiento**

| Estado | Rango | Color | Descripción |
| ----- | ----- | ----- | ----- |
| Bajo | \< 70% | 🔴 | Hidratación baja |
| Progreso | 70-89% | 🟡 | En camino |
| Óptimo | 90-110% | 🟢 | Rango ideal |
| Exceso | \> 120% | 🔵 | Sobrehidratación |

### **5.3 Reglas de recálculo automático**

1. **Al cambiar perfil:**

   * Se recalcula `recommendedGoalMl`  
   * Si `isCustomGoal = false`: `activeGoalMl = recommendedGoalMl`  
   * Si `isCustomGoal = true`: Se notifica cambio pero no se sobrescribe  
2. **Al editar meta manualmente:**

   * `activeGoalMl` \= valor ingresado  
   * `isCustomGoal = true`  
   * `recommendedGoalMl` sigue existiendo (consultable)  
3. **Al restaurar meta automática:**

   * `activeGoalMl = recommendedGoalMl`  
   * `isCustomGoal = false`

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## **6\. REQUERIMIENTOS FUNCIONALES**

### **6.1 Onboarding (Primera vez)**

**RF-001: Configuración inicial de perfil**

* **Entrada:** Edad, sexo, peso, nivel de actividad, horas de ejercicio, uso de creatina  
* **Validación:** Según rangos establecidos (ver sección 4.1)  
* **Salida:** Perfil guardado en Isar  
* **Acción:** Calcular meta recomendada inicial

**RF-002: Cálculo de meta inicial**

* **Entrada:** Datos del perfil  
* **Proceso:** Aplicar fórmula científica  
* **Salida:** `HydrationSettings` creado con meta recomendada

**RF-003: Flujo único**

* El onboarding se muestra solo una vez  
* Al completarlo, redirige a Dashboard  
* No se puede omitir  
* No se vuelve a mostrar

### **6.2 Dashboard (Pantalla principal)**

**RF-004: Visualización de meta activa**

* Mostrar `activeGoalMl` de forma prominente  
* Formato: "X.X L" o "X,XXX ml"

**RF-005: Visualización de consumo acumulado**

* Suma de todos los registros del día actual  
* Actualización en tiempo real

**RF-006: Indicador de progreso**

* **Tipo:** Barra de progreso o indicador circular  
* **Porcentaje:** (consumo / meta) × 100  
* **Color:** Según estado (bajo/progreso/óptimo/exceso)

**RF-007: Botones de registro rápido**

* \+250 ml  
* \+500 ml  
* \+1000 ml  
* Al presionar: guardar registro con timestamp actual  
* Actualizar UI inmediatamente

**RF-008: Registro personalizado**

* Input numérico para cantidad custom  
* Validación: 1-2000 ml por registro  
* Guardar con timestamp actual

**RF-009: Lista de registros del día**

* Mostrar todos los registros de hoy  
* Formato: "HH:mm \- XXX ml"  
* Ordenados de más reciente a más antiguo  
* Acción: Eliminar registro individual

**RF-010: Acceso a Settings**

* Botón/ícono visible en Dashboard  
* Navegación a pantalla de configuración

### **6.3 History (Historial)**

**RF-011: Visualización de últimos 7 días**

* Gráfica simple: consumo vs meta por día  
* Lista de días con resumen

**RF-012: Detalle por día**

* Fecha  
* Consumo total  
* Meta del día  
* Porcentaje de cumplimiento  
* Estado (bajo/progreso/óptimo/exceso)

**RF-013: Estadísticas semanales**

* Promedio de cumplimiento  
* Días óptimos (90-110%)  
* Días bajos (\<70%)

### **6.4 Settings (Configuración)**

**RF-014: Edición de perfil**

* Permitir modificar todos los campos de `UserProfile`  
* Validaciones activas  
* Al guardar: recalcular `recommendedGoalMl`

**RF-015: Visualización de meta recomendada**

* Mostrar `recommendedGoalMl` calculada  
* Mostrar factores del cálculo (desglose)  
* Siempre consultable

**RF-016: Edición de meta activa**

* Input numérico  
* Rango: 500-10000 ml  
* Al editar: `isCustomGoal = true`

**RF-017: Restaurar meta automática**

* Botón "Usar meta recomendada"  
* Acción: `activeGoalMl = recommendedGoalMl`, `isCustomGoal = false`

**RF-018: Notificación de cambio en meta recomendada**

* Si `isCustomGoal = true` y se modifica el perfil  
* Mostrar mensaje: "La meta recomendada cambió a X ml. Tu meta actual es Y ml."  
* Opción de actualizar o mantener

**RF-019: Modo oscuro**

* Toggle habilitado desde v1.0  
* Persistir preferencia

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## **7\. REQUERIMIENTOS NO FUNCIONALES**

### **7.1 Rendimiento**

* **RNF-001:** Tiempo de respuesta de registro \< 2 segundos  
* **RNF-002:** Apertura de app \< 3 segundos en dispositivos modernos  
* **RNF-003:** Recálculo de meta automática sin lag perceptible

### **7.2 Confiabilidad**

* **RNF-004:** Persistencia garantizada tras cierre abrupto de app  
* **RNF-005:** Funcionamiento estable por 30 días continuos sin crashes  
* **RNF-006:** Cero pérdida de datos en reinicio de dispositivo

### **7.3 Usabilidad**

* **RNF-007:** UI minimalista funcional  
* **RNF-008:** Máximo 3 taps para registrar agua  
* **RNF-009:** Dashboard como pantalla principal (navegación mínima)

### **7.4 Compatibilidad**

* **RNF-010:** Android 5.0+ (API 21+)  
* **RNF-011:** iOS 12.0+  
* **RNF-012:** Funcionamiento 100% offline

### **7.5 Mantenibilidad**

* **RNF-013:** Código modular y escalable  
* **RNF-014:** Documentación inline en funciones críticas  
* **RNF-015:** Arquitectura preparada para integración futura con backend

### **7.6 Seguridad**

* **RNF-016:** Datos almacenados solo localmente  
* **RNF-017:** No transmisión de datos a servicios externos  
* **RNF-018:** Sin recolección de analytics en v1.0

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## **8\. FLUJOS DE USUARIO**

### **8.1 Primer uso**

1\. Usuario abre app  
2\. Sistema detecta: no hay perfil  
3\. Mostrar Onboarding  
4\. Usuario completa formulario  
5\. Sistema valida datos  
6\. Sistema calcula meta recomendada  
7\. Sistema guarda perfil \+ settings  
8\. Redirigir a Dashboard

### **8.2 Uso diario típico**

1\. Usuario abre app → Dashboard  
2\. Usuario ve progreso del día  
3\. Usuario presiona "+500 ml"  
4\. Sistema guarda registro  
5\. UI actualiza progreso  
6\. (Repetir 3-5 según necesidad)

### **8.3 Cambio de perfil**

1\. Usuario abre Settings  
2\. Usuario modifica peso (ej: 75 → 78 kg)  
3\. Sistema recalcula recommendedGoalMl  
4\. Si isCustomGoal \= false:  
   → activeGoalMl \= recommendedGoalMl (actualización silenciosa)  
5\. Si isCustomGoal \= true:  
   → Mostrar notificación de cambio  
   → Usuario decide: actualizar o mantener

### **8.4 Personalización de meta**

1\. Usuario abre Settings  
2\. Usuario edita "Meta diaria"  
3\. Usuario ingresa: 3000 ml  
4\. Sistema valida (500-10000)  
5\. Sistema guarda: activeGoalMl \= 3000, isCustomGoal \= true  
6\. Dashboard muestra nueva meta  
7\. Meta recomendada sigue disponible en Settings

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## **9\. CASOS DE USO DETALLADOS**

### **CU-001: Registrar consumo de agua**

**Actor:** Usuario  
 **Precondición:** App abierta en Dashboard  
 **Flujo principal:**

1. Usuario presiona botón "+500 ml"  
2. Sistema crea `HydrationLog` con:  
   * timestamp \= ahora  
   * amountMl \= 500  
   * date \= fecha actual (00:00:00)  
3. Sistema guarda en Isar  
4. Sistema actualiza consumo acumulado del día  
5. Sistema actualiza indicador de progreso  
6. Sistema actualiza lista de registros

**Flujo alternativo 1: Cantidad personalizada**

1. Usuario presiona "Otro"  
2. Sistema muestra input numérico  
3. Usuario ingresa cantidad  
4. Continuar desde paso 2 del flujo principal

**Flujo alternativo 2: Eliminación de registro**

1. Usuario desliza/presiona registro en lista  
2. Sistema muestra confirmación  
3. Usuario confirma  
4. Sistema elimina registro de Isar  
5. Sistema actualiza consumo y progreso

---

### **CU-002: Editar perfil y recalcular meta**

**Actor:** Usuario  
 **Precondición:** Perfil existente  
 **Flujo principal:**

1. Usuario abre Settings  
2. Usuario modifica uno o más campos (ej: peso, horas ejercicio)  
3. Usuario presiona "Guardar"  
4. Sistema valida campos  
5. Sistema actualiza `UserProfile`  
6. Sistema recalcula `recommendedGoalMl`  
7. Si `isCustomGoal = false`:  
   * Sistema actualiza `activeGoalMl = recommendedGoalMl`  
   * Notificación silenciosa  
8. Si `isCustomGoal = true`:  
   * Sistema muestra: "Meta recomendada cambió a X ml. Tu meta actual: Y ml"  
   * Usuario elige: "Actualizar" o "Mantener mi meta"  
9. Sistema guarda cambios

**Postcondición:** Meta recalculada y guardada

---

### **CU-003: Consultar historial semanal**

**Actor:** Usuario  
 **Precondición:** Al menos 1 día con registros  
 **Flujo principal:**

1. Usuario navega a History  
2. Sistema consulta últimos 7 días de `HydrationLog`  
3. Sistema agrupa por fecha  
4. Sistema calcula:  
   * Consumo total por día  
   * Meta por día (de `HydrationSettings` en esa fecha)  
   * Porcentaje de cumplimiento  
   * Estado (bajo/progreso/óptimo/exceso)  
5. Sistema muestra gráfica \+ lista

**Postcondición:** Usuario visualiza tendencia semanal

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## **10\. DISEÑO DE UI (Minimalista Funcional)**

### **10.1 Principios de diseño**

* **Minimalismo:** Solo lo esencial visible  
* **Funcionalidad primero:** No sacrificar usabilidad por estética  
* **Jerarquía clara:** Meta → Progreso → Acciones  
* **Acceso rápido:** Registrar agua en 1-2 taps

### **10.2 Dashboard (wireframe conceptual)**

┌─────────────────────────────┐  
│  ⚙️                   📊    │  ← Settings / History  
├─────────────────────────────┤  
│                             │  
│      Meta: 3.5 L            │  ← Grande, prominente  
│                             │  
│   ●●●●●●●●●○○○  72%         │  ← Barra progreso  
│   2.5 L / 3.5 L             │  
│                             │  
├─────────────────────────────┤  
│  \[+250ml\] \[+500ml\] \[+1L\]    │  ← Botones rápidos  
│  \[Otro...\]                  │  
├─────────────────────────────┤  
│  Hoy:                       │  
│  • 14:35 \- 500 ml    \[🗑\]   │  
│  • 12:20 \- 250 ml    \[🗑\]   │  
│  • 09:15 \- 500 ml    \[🗑\]   │  
└─────────────────────────────┘

### **10.3 Onboarding**

* **Estilo:** Formulario paso a paso (wizard)  
* **Pasos:** 3-4 pantallas máximo  
  1. Datos básicos (edad, sexo, peso)  
  2. Actividad (nivel, horas ejercicio)  
  3. Suplementación (creatina)  
  4. Confirmación \+ cálculo de meta  
* **Validaciones:** En tiempo real  
* **Navegación:** Botones "Siguiente" / "Atrás"

### **10.4 Settings**

┌─────────────────────────────┐  
│  ← Configuración            │  
├─────────────────────────────┤  
│  PERFIL                     │  
│  Edad: 32 años              │  
│  Sexo: Masculino            │  
│  Peso: 75 kg                │  
│  Actividad: Moderado        │  
│  Ejercicio: 1.5 hrs/día     │  
│  Creatina: Sí               │  
│  \[Editar perfil\]            │  
├─────────────────────────────┤  
│  META DE HIDRATACIÓN        │  
│  Recomendada: 3,825 ml      │  
│  (Ver desglose)             │  
│                             │  
│  Meta activa: 3,500 ml 🔧   │  
│  \[Editar\] \[Restaurar auto\]  │  
├─────────────────────────────┤  
│  PREFERENCIAS               │  
│  Modo oscuro: \[toggle\]      │  
└─────────────────────────────┘

### **10.5 History**

* **Gráfica:** Líneas o barras (consumo vs meta)  
* **Eje X:** Últimos 7 días  
* **Eje Y:** Mililitros  
* **Lista:** Resumen por día con estado visual

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## **11\. PLAN DE DESARROLLO**

### **11.1 Orden de implementación**

**Fase 1: Fundamentos**

1. Setup inicial de proyecto Flutter  
2. Configuración de Isar  
3. Definición de modelos (`UserProfile`, `HydrationLog`, `HydrationSettings`)  
4. Generación de código (`build_runner`)  
5. Servicio de cálculo (`HydrationCalculatorService`)  
6. Pruebas unitarias de lógica de cálculo

**Fase 2: Lógica de negocio**

1. Providers Riverpod:  
   * `profileProvider`  
   * `hydrationSettingsProvider`  
   * `hydrationLogsProvider`  
2. Repositorios/servicios de persistencia  
3. Lógica de recálculo automático

**Fase 3: UI básica**

1. Onboarding funcional (sin diseño pulido)  
2. Dashboard funcional:  
   * Mostrar meta  
   * Mostrar progreso  
   * Botones de registro funcionales  
   * Lista de registros  
3. Settings funcional:  
   * Edición de perfil  
   * Edición de meta  
4. History básico

**Fase 4: Integración y pruebas**

1. Flujo completo end-to-end  
2. Pruebas de persistencia  
3. Pruebas de cambio de perfil  
4. Pruebas de estados edge case

**Fase 5: Refinamiento**

1. Mejoras de UX  
2. Animaciones básicas  
3. Modo oscuro  
4. Optimizaciones de rendimiento

### **11.2 Criterios de aceptación (v1.0 completa)**

✅ **Funcionalidad:**

* \[ \] Onboarding completable sin errores  
* \[ \] Cálculo de meta coherente con fórmula científica  
* \[ \] Registro de agua persistente tras reinicio  
* \[ \] Historial mostrando datos correctos  
* \[ \] Edición de perfil recalcula meta automáticamente  
* \[ \] Meta personalizada se mantiene tras edición

✅ **Rendimiento:**

* \[ \] Registro de agua \< 2 segundos  
* \[ \] App estable por 30 días continuos sin crash  
* \[ \] Sin pérdida de datos tras cierre abrupto

✅ **UX:**

* \[ \] Dashboard accesible en 1 tap desde apertura  
* \[ \] Registro rápido en 1-2 taps  
* \[ \] Modo oscuro funcional

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## **12\. PREPARACIÓN PARA FUTURAS VERSIONES**

### **12.1 Arquitectura extensible**

La estructura modular permite agregar:

**v2.0 potencial:**

* Módulo de actividad física avanzada  
* Módulo de rendimiento deportivo  
* Score de recuperación  
* Análisis de tendencias

**v3.0 potencial:**

* Backend (Firebase/Supabase)  
* Sincronización multi-dispositivo  
* Integración HealthKit/Google Fit  
* Notificaciones inteligentes  
* Sistema predictivo (ML)

### **12.2 Puntos de extensión**

**En código:**

* `features/` permite agregar nuevos módulos sin afectar existentes  
* Providers desacoplados facilitan lógica compartida  
* Servicios reutilizables en `core/`

**En base de datos:**

* Isar permite migraciones automáticas  
* Schema versionado  
* Relaciones futuras entre colecciones

**En UI:**

* Navegación mediante rutas nombradas  
* Componentes reutilizables en `widgets/`

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## **13\. GLOSARIO**

| Término | Definición |
| ----- | ----- |
| Meta recomendada | Hidratación calculada científicamente según perfil |
| Meta activa | Meta que el usuario ve y usa (puede ser personalizada) |
| isCustomGoal | Flag que indica si el usuario editó manualmente la meta |
| Consumo acumulado | Suma de todos los registros del día actual |
| Estado de cumplimiento | Categoría basada en porcentaje: bajo/progreso/óptimo/exceso |
| ml/kg | Mililitros de agua por kilogramo de peso corporal |
| Nivel de actividad | Clasificación: sedentario, moderado, alto |

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## **14\. REFERENCIAS CIENTÍFICAS**

1. **EFSA Panel on Dietetic Products, Nutrition, and Allergies (NDA)**  
    Scientific Opinion on Dietary Reference Values for water (2010)

2. **Institute of Medicine (IOM)**  
    Dietary Reference Intakes for Water, Potassium, Sodium, Chloride, and Sulfate (2005)

3. **American College of Sports Medicine (ACSM)**  
    Exercise and Fluid Replacement Position Stand (2007)

4. **International Society of Sports Nutrition (ISSN)**  
    Position Stand: Creatine Supplementation and Exercise (2017)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## **15\. CONTROL DE VERSIONES**

| Versión | Fecha | Autor | Cambios |
| ----- | ----- | ----- | ----- |
| 1.0 | Feb 2026 | Equipo técnico | Versión inicial aprobada |

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

**ESTADO: APROBADO PARA DESARROLLO**

\---

Este documento técnico está listo para:  
\- Desarrollo inmediato  
\- Revisión técnica  
\- Estimación de tiempo  
\- Asignación de tareas


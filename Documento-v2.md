# **Objetivo de Esta Versión (2.1)**

NO cambiar arquitectura.  
 NO modificar base de datos.  
 NO alterar lógica principal.

Solo:

➡ Elevar experiencia visual a nivel fitness moderno.  
 ➡ Hacer que el Dashboard sea visualmente potente.  
 ➡ Mantener coherencia con modelo actual.

---

# **3️⃣ Requerimientos Nuevos de UI (Modern Fitness)**

---

# **🏠 3.1 Dashboard – Rediseño Completo**

## **RF-UI-01 – Círculo de Progreso Animado**

Debe:

* Mostrar porcentaje calculado desde:  
   intakeTotalHoy / baseGoalMl

* Animarse al cargar

* Animarse al agregar agua

Visual:

* Línea gruesa (12–16px)

* Azul eléctrico

* Fondo oscuro recomendado

---

## **RF-UI-02 – Indicador Numérico Central**

Dentro del círculo:

`78%`  
`1560 / 2000 ml`

Debe actualizarse en tiempo real.

---

## **RF-UI-03 – Botones Rápidos Modernizados**

Reemplazar botones actuales por:

Botones cápsula:

* \+250 ml

* \+500 ml

* \+750 ml

Requisitos:

* BorderRadius 24

* Elevación ligera

* Animación scale al presionar

* Haptic feedback ligero

---

## **RF-UI-04 – Botón Flotante Principal**

FAB grande centrado:

💧 Agregar

Debe abrir modal para ingresar cantidad personalizada.

---

## **RF-UI-05 – Racha Visible**

Calcular desde historial:

Mostrar debajo del progreso:

🔥 Racha: X días

Condición:

* Día cuenta como cumplido si intake \>= goalMl

---

## **RF-UI-06 – Mensajes Motivacionales Dinámicos**

Basado en porcentaje:

* \<40% → “Aún puedes mejorar.”

* 40–80% → “Vas bien.”

* 80–99% → “Ya casi.”

* 100%+ → “Meta cumplida 💪”

---

# **📊 3.2 Estadísticas – Mejora Visual**

Usar `DailyHistoryData`.

---

## **RF-UI-07 – Gráfica Semanal**

* 7 barras

* Altura proporcional a intakeMl

* Color:

  * Azul fuerte si cumple meta

  * Azul tenue si no

  * Gris si no hay registro

---

## **RF-UI-08 – Métricas Secundarias**

Mostrar:

* Promedio semanal

* Mejor día

* % cumplimiento semanal

* Racha actual

---

# **👤 3.3 Perfil – Modernización Visual**

Sin cambiar lógica existente.

Cambios:

* Cards con fondo oscuro

* Bordes redondeados 16

* Switch más visible

* Botón “Recalcular meta” destacado

---

# **🎨 4️⃣ Sistema Visual Oficial**

---

## **Modo Oscuro (Predeterminado)**

* Fondo: \#0F172A

* Cards: \#1E293B

* Azul principal: \#3B82F6

* Verde éxito: \#22C55E

* Texto blanco/gris claro

---

## **Modo Claro**

* Fondo: \#F4F6F8

* Azul principal: \#1565C0

* Texto oscuro

---

## **Tipografía**

* Inter (recomendada)

* Alternativa: Material default optimizada

---

# **5️⃣ Animaciones Requeridas**

* Animación progresiva del círculo

* Scale animation en botones

* Fade-in en estadísticas

* Micro vibración al sumar agua

---

# **6️⃣ Lo Que NO Se Modifica**

* Modelos Isar

* Lógica de persistencia

* Estructura Riverpod

* Flujo onboarding

* Sistema de notificaciones

---

# **7️⃣ Impacto Técnico**

No requiere:

* Nuevas tablas

* Nuevas colecciones

* Migración de base de datos

* Cambios en schema

Solo:

* UI layer

* Widgets personalizados

* Animaciones

---

# **8️⃣ Resultado Esperado**

La app debe sentirse:

* Profesional

* Deportiva

* Fluida

* Minimalista

* Motivadora

Nivel visual comparable a apps fitness premium.


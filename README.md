1. Agrega acciones de edición y actualización
Para cada uno de los siguientes modelos, implementa las acciones edit y update en el controlador y las vistas:

User

Chat

Message

Cada vista de edición debe incluir un formulario que permita actualizar todos los atributos editables del registro.

💡 Usa form_with model: para reutilizar la misma estructura de formulario que en las vistas de creación (new).

2. Muestra los registros asociados en las vistas de detalle (show)
Actualiza las vistas show de cada modelo para incluir información de sus modelos relacionados:

User#show: Muestra una lista de todos los chats en los que participa el usuario y los mensajes que ha enviado.

Chat#show: Muestra los nombres del emisor y receptor, y una lista de todos los mensajes del chat.

Message#show: Muestra el usuario y el chat asociados.

Utiliza Ruby embebido (ERB) y listas o tablas HTML básicas.

3. Agrega validaciones a los formularios de actualización
Asegúrate de que se muestren los errores de validación al actualizar registros. Por ejemplo:

Si un usuario intenta guardar un correo electrónico que ya está en uso

Si se intenta enviar un mensaje con el cuerpo vacío

Usa model.errors.full_messages para mostrar los errores cerca del formulario.

4. Agrega enlaces para editar
En cada vista index y show, agrega enlaces para editar el registro:

Ejemplo: En users/show.html.erb, incluye un enlace a "Editar usuario".

Ejemplo: En messages/index.html.erb, incluye un enlace junto a cada mensaje para "Editar mensaje".

Usa los helpers link_to con edit_*_path.

5. (Bonus) Muestra el conteo de mensajes
Como extra, muestra el número de mensajes enviados por cada usuario en users/index.html.erb.

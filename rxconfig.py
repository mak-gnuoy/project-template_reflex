import reflex as rx

config = rx.Config(
    app_name="app",
    app_module_import="app.myapp",
    plugins=[rx.plugins.TailwindV3Plugin()],
)

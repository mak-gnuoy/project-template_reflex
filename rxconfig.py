import reflex as rx

config = rx.Config(
    app_name="myapp",
    app_module_import="app",
    plugins=[rx.plugins.TailwindV3Plugin()],
)

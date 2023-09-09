import Config

config :cachenvd,
  nvd_api_key: System.get_env("NVD_API_KEY")

# import_config "#{config_env()}.exs"

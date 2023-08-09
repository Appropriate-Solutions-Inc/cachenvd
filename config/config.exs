import Config

config :cachenvd, :keys, nvd_api_key: System.get_env("NVD_API_KEY")

MQTT_CONFIG = {
  host: '192.168.1.8',
  port: 1883,     
  client_id: 'rails_client',
  username: 'admin',
  password: 'Proyecto2024'
}

MQTT_CLIENT = MQTT::Client.new(MQTT_CONFIG)
MQTT_CLIENT.connect
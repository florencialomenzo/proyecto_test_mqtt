module Mqtt 
  class Publisher 
     def publish_message(message, topic)
       MQTT_CLIENT.publish(topic, message)
       puts 'Message published to MQTT!'
     end
  end
end

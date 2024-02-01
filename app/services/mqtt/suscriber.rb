module Mqtt 
  class Suscriber 
    def initialize
      @running = false
    end

    def start_subscription(topic)
      return if @running

      @running = true
      @subscription_thread = Thread.new do
        MQTT_CLIENT.subscribe(topic)

        puts "Subscribed to topic: #{topic}!"

        loop do
          break unless @running

          topic, message = MQTT_CLIENT.get

          if topic && message
            puts "Received message on topic '#{topic}': #{message}"
          else
            puts "No message received"
          end
        end
      end
    end

    def stop_subscription
      return unless @running

      @running = false
      @subscription_thread.join
      puts "Subscription stopped."
    end

    def stop_all_subscriptions
      @subscription_threads.each do |topic, thread|
        stop_subscription(topic)
      end
    end
  end
end

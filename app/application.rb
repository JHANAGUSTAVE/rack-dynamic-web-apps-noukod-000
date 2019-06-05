class Application
 
  def call(env)
    resp = Rack::Response.new
 
    num_1 = Kernel.rand(1..20)
    num_2 = Kernel.rand(1..20)
    num_3 = Kernel.rand(1..20)
 
    if num_1==num_2 && num_2==num_3
      resp.write "You Win"
    else
      resp.write "You Lose"
    end
 
    resp.finish
  end
 
end
Notice that we only changed the puts statements into resp.write statements. That's it! Web servers are just big ruby apps that respond to the user in an HTTP response rather than via puts statements. Let's give the user a bit more information about what numbers they received by writing the numbers to the response as well. The #write method can be called many times to build up the full response. The response isn't sent back to the user until #finish is called.

class Application
 
  def call(env)
    resp = Rack::Response.new
 
    num_1 = Kernel.rand(1..20)
    num_2 = Kernel.rand(1..20)
    num_3 = Kernel.rand(1..20)
 
    resp.write "#{num_1}\n"
    resp.write "#{num_2}\n"
    resp.write "#{num_3}\n"
 
    if num_1==num_2 && num_2==num_3
      resp.write "You Win"
    else
      resp.write "You Lose"
    end
 
    resp.finish
  end
 
end
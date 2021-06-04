require "json"

data = open("DB.data", "r").read

cont = JSON.parse data.gsub('=>', ':')

# Method for webpage creation
def build_web_page (hash)

    # Put info into a array
    content = []
    hash.each do |k, v|
        content = v
    end

    #Create a new file with data
    output = open("index.html", "w")

    output.puts "<html>"
    output.puts "<head>"
    output.puts "</head>"
    output.puts "<body>"
    output.puts "\t<ul>"

    #Creating body's items
    content.each do |i|

        i.each do |k, v|

            if k == "id" || k == "sol" || k == "earth_date"

                if k == "id" || k == "sol"
                    output.puts "\t\t<li>"
                    output.puts "\t\t\t<div>"
                    output.puts "\t\t\t\t<h2>#{k}</h2>"
                    output.puts "\t\t\t\t<h3>#{v}</h3>"  
                    output.puts "\t\t\t</div>"
                    output.puts "\t\t</li>"
                else
                    k = "earth date"
                    output.puts "\t\t<li>"
                    output.puts "\t\t\t<div>"
                    output.puts "\t\t\t\t<h2>#{k}</h2>"
                    output.puts "\t\t\t\t<h3>#{v}</h3>"  
                    output.puts "\t\t\t</div>"
                    output.puts "\t\t</li>"
                end

            elsif k == "camera"

                output.puts "\t\t<li>"
                output.puts "\t\t\t<div>"
                output.puts "\t\t\t\t<h2>#{k}</h2>"

                v.each do |k, v|
                    output.puts "\t\t\t\t<h3>#{k}</h3>"
                    output.puts "\t\t\t\t<p>#{v}</p>"  
                end
                
                output.puts "\t\t\t</div>"
                output.puts "\t\t</li>"

            elsif k == "img_src"

                output.puts "\t\t\t<div>"
                output.puts "\t\t\t\t<img src='#{v}'></img>"
                output.puts "\t\t\t</div>"

            elsif k == "rover"

                output.puts "\t\t<li>"
                output.puts "\t\t\t<div>"

                output.puts "\t\t\t\t<h2>#{k}</h2>"
                v.each do |k, v|
                    output.puts "\t\t\t\t\t<h3>#{k}</h3>"
                    output.puts "\t\t\t\t\t<p>#{v}</p>"  
                end

                output.puts "\t\t\t</div>"
                output.puts "\t\t</li>"

            end
        
        end
        output.puts "\t\t<hr>"
    end

    #Close html structure
    output.puts "\t</ul>"
    output.puts "</body>"
    output.puts "</html>"

end

#Generate index.html
build_web_page cont


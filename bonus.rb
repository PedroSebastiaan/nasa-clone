require "json"

data = open("DB.data", "r").read

cont = JSON.parse data.gsub('=>', ':')

#Creating method for count
def photos_count (hash)

    content = []
    hash.each do |k, v|
        content = v
    end

    #First array for save names
    camera_names = []

    content.each do |i|
        #Collect all names
        i.each do |k, v|
            if k == "camera"
                v.each do |k, v|
                    if k == "name"
                        camera_names.push v
                    end
                end
            end
        end
    end

    #Creating a new hash
    grouped = camera_names.group_by{|x| x}

    grouped.each do |k, v|
        grouped [k] = v.count
    end
    
    #Print response
    print grouped
    print "\n"
    return grouped
    
end

photos_count cont
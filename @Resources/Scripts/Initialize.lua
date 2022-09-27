function check_file(name)
    file = io.open(name, "r")
    if file~=nil then
        io.close(file)
        return true
    else 
        return false
    end
end

function Initialize()
    if (check_file(SKIN:GetVariable("@").."Secrets.inc")) then
        print("Secrets file is already there, nothing to do")
        return
    else
        print("Secrets file doesn't exist, copying template")
        template_file = io.open(SKIN:GetVariable("@").."Secrets.inc.template", "r")
        template = template_file:read("*a")
        output = io.open(SKIN:GetVariable("@").."Secrets.inc", "w")

        output:write(template)

        template_file:close()
        output:close()
        print("Copied template")
    end
end

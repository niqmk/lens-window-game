local Filesystem = {}

function Filesystem.inGameLS(dir)
    local output = {}
    local path = 'files/' .. dir
    local files = love.filesystem.getDirectoryItems(path)
    for i,filename in ipairs(files) do
        local info = love.filesystem.getInfo(path..'/'..filename)
        if info.type == 'file' then
            append(output,createFileObject(filename))
        end

        if info.type == 'directory' then
            append(output,createFolderObject(filename,dir))
        end
    end
    return output
end

return Filesystem
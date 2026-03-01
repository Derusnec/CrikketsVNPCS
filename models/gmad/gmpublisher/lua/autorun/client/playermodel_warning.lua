if CLIENT then
    local REQUIRED_FILE = "materials/models/alvaroports/shared/test_warning.vmt"

    -- Substitua o link abaixo pelo link do seu mod na Steam Workshop:
    local WORKSHOP_LINK = "https://steamcommunity.com/sharedfiles/filedetails/?id=3486238431"

    -- Detecta o idioma do cliente
    local lang = GetConVar("gmod_language"):GetString()

    -- Mensagens traduzidas
    local messages = {
        ["pt-BR"] = "[ATENÇÃO] Os playermodels do Alvaro, a partir de 23/05/2025, precisam usar o addon de texturas compartilhadas. Baixe aqui: ",
        ["pt-PT"] = "[ATENÇÃO] Os playermodels do Alvaro, a partir de 23/05/2025, precisam de um addon de texturas partilhadas. Faça o download aqui: ",
        ["en"]    = "[WARNING] Alvaro's playermodels, starting on 2025-05-23, require the shared textures addon. Download here: ",
        ["es"]    = "[ADVERTENCIA] Los playermodels de Alvaro, a partir del 23/05/2025, requieren el addon de texturas compartidas. Descárgalo aquí: ",
        ["ru"]    = "[ВНИМАНИЕ] Модели игрока от Alvaro с 23.05.2025 требуют аддон с общими текстурами. Скачать здесь: "
    }

    local msg = messages[lang] or messages["en"]

    -- Executa o aviso apenas uma vez quando o jogador entra
    hook.Add("InitPostEntity", "CheckRequiredAddonOnce", function()
        if not file.Exists(REQUIRED_FILE, "GAME") then
            chat.AddText(Color(255, 100, 100), msg, Color(255, 255, 255), WORKSHOP_LINK)
        end
    end)
end

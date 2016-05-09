local config={
  gesior = "yes" -- Se usar ZNOTE deixe a opção como no

  -- [RECORD] = {PONTOS}
  [50] = {points = 5}
  [100] = {points = 10}
  }

function onRecord(current, old, cid){
    for_, pid in inpair(getPlayerOnline()) do
      if(config[curret]) -- Se igual record configurado
        if(gesior == "yes")
          db.executeQuery("UPDATE `accounts` SET `premium_points` = `premium_points` + "..config[current].points.." WHERE `name` == '"..getPlayerAccount(pid).."'")
        else
          db.executeQuery("UPDATE `znote_accounts` SET `points` = `points` + "..config[current].points.." WHERE `account_id` == '"..getPlayerAccount(pid).."'")
        end
    end

    if(config[current])
       addEvent(doBroadcastMessage, 150, "O servidor bateu um novo record com "..current.." jogadores online, todos os jogadores online receberam "..config[current].points.." pontos.", MESSAGE_EVENT_ADVANCE)
    else
      addEvent(doBroadcastMessage, 150, "New record: " .. current .. " players are logged in.", MESSAGE_STATUS_DEFAULT)
    end

    db.executeQuery("INSERT INTO `server_record` (`record`, `world_id`, `timestamp`) VALUES (" .. current .. ", " .. getConfigValue('worldId') .. ", " .. os.time() .. ");")
 return true
end

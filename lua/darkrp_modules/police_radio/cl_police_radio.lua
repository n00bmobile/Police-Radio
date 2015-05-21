policeRadio = {}
--[[Config Start]]--
policeRadio.setTime = 30 //Delay between Radio Quotes
policeRadio.cops = { //Who can hear the Police Radio
"Civil Protection", 
"Civil Protection Chief"
}
policeRadio.turn = { //Starting sounds
"npc/combine_soldier/vo/off1.wav",
"npc/combine_soldier/vo/off2.wav",
"npc/combine_soldier/vo/off3.wav",
"npc/metropolice/vo/off4.wav"
}
policeRadio.quotes = { //Actual quotes
"npc/metropolice/vo/404zone.wav",
"npc/metropolice/vo/anyonepickup647e.wav",
"npc/metropolice/vo/atcheckpoint.wav",
"npc/metropolice/vo/backup.wav",
"npc/metropolice/vo/block.wav",
"npc/metropolice/vo/blockisholdingcohesive.wav",
"npc/metropolice/vo/bugs.wav",
"npc/metropolice/vo/catchthatbliponstabilization.wav",
"npc/metropolice/vo/checkformiscount.wav",
"npc/metropolice/vo/clearno647no10-107.wav",
"npc/metropolice/vo/code100.wav",
"npc/metropolice/vo/code7.wav",
"npc/metropolice/vo/condemnedzone.wav",
"npc/metropolice/vo/control100percent.wav",
"npc/metropolice/vo/deservicedarea.wav",
"npc/metropolice/vo/dismountinghardpoint.wav",
"npc/metropolice/vo/distributionblock.wav",
"npc/metropolice/vo/document.wav",
"npc/metropolice/vo/examine.wav",
"npc/metropolice/vo/getoutofhere.wav",
"npc/metropolice/vo/hardpointscanning.wav",
"npc/metropolice/vo/highpriorityregion.wav",
"npc/metropolice/vo/holdit.wav",
"npc/metropolice/vo/holditrightthere.wav",
"npc/metropolice/vo/infestedzone.wav",
"npc/metropolice/vo/innoculate.wav",
"npc/metropolice/vo/inject.wav",
"npc/metropolice/vo/inpositionathardpoint.wav",
"npc/metropolice/vo/inpositiononeready.wav",
"npc/metropolice/vo/intercede.wav",
"npc/metropolice/vo/interlock.wav",
"npc/metropolice/vo/ivegot408hereatlocation.wav",
"npc/metropolice/vo/keepmoving.wav",
"npc/metropolice/vo/localcptreportstatus.wav",
"npc/metropolice/vo/lock.wav",
"npc/metropolice/vo/looseparasitics.wav",
"npc/metropolice/vo/malignant.wav",
"npc/metropolice/vo/moveit2.wav",
"npc/metropolice/vo/movingtohardpoint.wav",
"npc/metropolice/vo/necrotics.wav",
"npc/metropolice/vo/nocontact.wav",
"npc/metropolice/vo/nonpatrolregion.wav",
"npc/metropolice/vo/novisualonupi.wav",
"npc/metropolice/vo/patrol.wav",
"npc/metropolice/vo/pickingupnoncorplexindy.wav",
"npc/metropolice/vo/possible404here.wav",
"npc/metropolice/vo/restrictedblock.wav",
"npc/metropolice/vo/search.wav",
"npc/metropolice/vo/sociocide.wav",
"npc/metropolice/vo/sterilize.wav",
"npc/metropolice/vo/stillgetting647e.wav",
"npc/metropolice/vo/terminalrestrictionzone.wav",
"npc/metropolice/vo/unitis10-65.wav",
"npc/metropolice/vo/unitis10-8standingby.wav",
"npc/metropolice/vo/visceratorisoffgrid.wav",
"npc/metropolice/vo/administer.wav",
"npc/metropolice/vo/chuckle.wav",
"npc/metropolice/vo/clearandcode100.wav",
"npc/metropolice/vo/controlsection.wav",
"npc/metropolice/vo/get11-44inboundcleaningup.wav",
"npc/metropolice/vo/gota10-107sendairwatch.wav",
"npc/metropolice/vo/protectioncomplete.wav",
"npc/metropolice/vo/ptatlocationreport.wav",
"npc/metropolice/vo/ptgoagain.wav",
"npc/metropolice/vo/upi.wav",
"npc/metropolice/vo/suspend.wav",
"npc/metropolice/vo/allunitsmovein.wav",
"npc/metropolice/vo/cauterize.wav",
"npc/metropolice/vo/classifyasdbthisblockready.wav",
"npc/metropolice/vo/cpbolforthat243.wav",
"npc/metropolice/vo/non-taggedviromeshere.wav",
"npc/metropolice/vo/possible10-103alerttagunits.wav",
"npc/metropolice/vo/possible647erequestairwatch.wav",
"npc/metropolice/vo/preparefor1015.wav",
"npc/metropolice/vo/proceedtocheckpoints.wav",
"npc/metropolice/vo/readytoamputate.wav",
"npc/metropolice/vo/requestsecondaryviscerator.wav",
"npc/metropolice/vo/teaminpositionadvance.wav"
}
--[[Config End]]--

function randomPoliceRadioSounds()
    if table.HasValue(policeRadio.cops, team.GetName(LocalPlayer():Team())) then
        randomQuoteChoice = table.Random(policeRadio.quotes)
		randomTurnChoice = table.Random(policeRadio.turn)
		
		surface.PlaySound(randomTurnChoice)
		
		timer.Simple(SoundDuration(randomTurnChoice), function() surface.PlaySound(randomQuoteChoice) end)
		timer.Simple(SoundDuration(randomQuoteChoice) +SoundDuration(randomTurnChoice), function() surface.PlaySound(randomTurnChoice) end)
    end
end
timer.Create("startRandomPoliceRadio", policeRadio.setTime, 0, randomPoliceRadioSounds)
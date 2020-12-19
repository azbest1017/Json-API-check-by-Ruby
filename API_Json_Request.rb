
require 'mechanize'

offers = [["leadgid.ru","1890","Миг"]]
acc = [["leadgid.ru","59541","1d15b8d0aac833e62bca1f25c3554c3977885f583be8ed9b720469bd26d4371e"],
["leadgid.ru","35043","7d15d1e5f4a3703693258a3b9b27aa3500cd47225b2a8aa2867fa2b1ca5d8ec9"],
["leadgid.ru","35645","a9994a30f97857a9eacd0661ca2a3ae6ade7292d401c2bc6aea0323f7cfbf195"],
["leadgid.ru","35583","a1bf2419e75eefa79306a6d190cc4af6c5e2cd774d9cbf392f9a00987a43def9"],
["leadgid.ru","34179","563708843a9dc0967f414060263dda27137578bcf88ab085a1da76db58a007d4"],
["leadgid.ru","34553","892592a740fe12dbc778389935467a82e3b29383baca85025bac0705d12672c1"],
["leadgid.ru","35041","3c015692fe5eaf411676d001aa87f0c3583a3a09f5a757e13a1b4e6de92b849e"],
["leadgid.ru","10934","4348e93435237c782add759032eff75977a1963439f3cb12ed150b1371b8b761"],
["leadgid.ru","62379","56527111aa13fbac445bed1b95aa2a2c8f25515e62e8092a6c17cf76cc81e26b"],
["leadgid.ru","61141","8a43a196c98fb49eb12c66aaecb7ceae69cf21b3baf0a2f99a8f927661a22a83"],
["leadgid.ru","23171","9a5541d2005c2fdbd47b9a1820ec4d838a1da438ac67cfe4be7977e4e2ee0b9f"],
["leadgid.ru","26771","a622b70be769c536e731e84a6329d154a9eed52e2a300aafeab1a6cac7f6d332"],
["leadgid.ru","44932","63ef408da2aba5de65ebb9ecd59d0aac38f6605e20182f4a30df561e034df916"],
["leadgid.ru","60702","3d99539478aed3890b66d509901788e93383cf4fc02eb79f7ff378ed7235841d"],
["leadgid.ru","61474","3c45b6afaa5bfb8b328dbe653c48c50877ca0cd160ef1000a0d7877a1f78a101"],
["leadgid.ru","62898","4d2a508ee6a4f057c11013b97a23ea0d5244197160e6d302ec2286a660d2c63e"],
["leadgid.ru","27477","7bc7952dd4e32c2b7a99824d676dbf6a6e52fa7242de02ef3f00d2d915963b0a"],
["leadgid.ru","23527","a3e242d33b135ce71484bf558f1a0cb7b0d44de066e8df491f5ebc8025cd9356"],
["leadgid.ru","24715","69ab43202d8cc6c98398da72439d118756f45610b1ea0cf8e823e7a60c0a1d99"],
["leadgid.ru","23399","9988879c11f0333f38b2ba013dc5ee712b330a92d847e2d2353138534109d718"],
["leadgid.ru","57865","f17d567f743b69f06ae0ce271d52f2aee0ae77648431208ba86bc17f71e9598b"],
["leadgid.ru","49490","10f181c10d29507386c8ca665ecbea5fbad2dc9b94217a74fcab1cfcf4a9ba8b"],
["leadgid.ru","57584","ff02699308afc729a0df7c4f129362bc2ab91307f348264bf1d90ca3680efb58"],
["leadgid.ru","61352","59d421408ce5f6b616b13783f46ccf7f865e62a6555dc9bee15e217a38685943"],
["leadgid.ru","42893","445c082cf0fa48c5c5515098e7bfc10234a54c44eb29e2665ea1341fc3e3cd1c"],
["leadgid.ru","61780","eabcc69b75590607ae41510c69f989478a6f49c6cfff748fe6426d448d012146"]]
data = ''
offers.each do |network_offer,offer_id,offer_name|
acc.each do |network_acc,acc_id,api|
		if network_offer == network_acc
				if network_offer == 'leadgid'
				mechanize_lg = Mechanize.new
				pre_lg = "https://leadgid.api.hasoffers.com/Apiv3/json?api_key="+ api + "&Target=Affiliate_Offer&Method=generateTrackingLink&offer_id="+ offer_id
				page_lg = mechanize_lg.get(pre_lg)
				link_lg = page_lg.body
				link_lg = link_lg.to_s
				if link_lg.include?('"status":1')
					otvet = network_offer + "," + offer_name + "," + offer_id + "," + acc_id + ",ON" + '</br'
					data +=otvet
				elsif link_lg.include?('"status":-1')
					otvet = network_offer + "," + offer_name + "," + offer_id + "," + acc_id + ",OFF" + '</br'
					data +=otvet
				else
					otvet = network_offer + "," + offer_name + "," + offer_id + "," + acc_id + ",ERROR" + '</br'
					data +=otvet
				end
			elsif network_offer == 'leads.su'
				mechanize_ls = Mechanize.new
				pre_ls = "https://api.leads.su/webmaster/offers/" + offer_id + "/?token=" + api
				page_ls = mechanize_ls.get(pre_ls)
				link_ls = page_ls.body
				link_ls = link_ls.to_s
				if link_ls.include?('"count":"1",')
					otvet = network_offer + "," + offer_name + "," + offer_id + "," + acc_id + ",ON" + '</br'
					data +=otvet
				elsif link_ls.include?('"count":"0",')
					otvet = network_offer + "," + offer_name + "," + offer_id + "," + acc_id + ",OFF" + '</br'
					data +=otvet
				else
					otvet = network_offer + "," + offer_name + "," + offer_id + "," + acc_id + ",ERROR" + '</br'
					data +=otvet
				end

			end
				
		end
end
end
print data
require 'httpclient'


links = [
["711 ls" ,"https://pxl.leads.su/click/0a165df1dafcb52eb32cb60d7f2779d7?aff_sub1=dobrozaim_ru_y_ls_59541_711_cpa-andrei6","dobrozaim.ru"],
["3169 lg","https://go.leadgid.ru/aff_c?offer_id=3169&aff_id=59541&aff_sub=dopo_kz_lg_59541_3169_cpa-andrei6","dopo.kz"],
["595 lg","https://pxl.leads.su/click/e218d709b19c841babdd15df472cb698?aff_sub1=limezaim_ru_y_ls_59541_595_cpa-andrei6","lime-zaim.ru"]]

links.each do |x,y,z|
last_url = z
httpc = HTTPClient.new
resp = httpc.get(y)
go = resp.header['Location'].to_s

if go.include? last_url
	puts x + " Работает"
else
	puts x + " No"
end


end

#!/bin/sh
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 1')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000001' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 2')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000002' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 3')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000003' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 4')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000004' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 5')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000005' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 6')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000006' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 7')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000007' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 8')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000008' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 9')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000009' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 10')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000010' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 11')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000011' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 12')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000012' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 13')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000013' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 14')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000014' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 15')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000015' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 16')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000016' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 17')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000017' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 18')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000018' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 19')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000019' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 20')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000020' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 21')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000021' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 22')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000022' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 23')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000023' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 24')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000024' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 25')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000025' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 26')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000026' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 27')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000027' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 28')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000028' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 29')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000029' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 30')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000030' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 31')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000031' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 32')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000032' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 33')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000033' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 34')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000034' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 35')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000035' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 36')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000036' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 37')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000037' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 38')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000038' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 39')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000039' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 40')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000040' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 41')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000041' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 42')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000042' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 43')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000043' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 44')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000044' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 45')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000045' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 46')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000046' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 47')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000047' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 48')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000048' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 49')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000049' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 50')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000050' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 51')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000051' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 52')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000052' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 53')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000053' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 54')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000054' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 55')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000055' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 56')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000056' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 57')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000057' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 58')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000058' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 59')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000059' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 60')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000060' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 61')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000061' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 62')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000062' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 63')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000063' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 64')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000064' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 65')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000065' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 66')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000066' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 67')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000067' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 68')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000068' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 69')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000069' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 70')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000070' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 71')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000071' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 72')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000072' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 73')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000073' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 74')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000074' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 75')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000075' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 76')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000076' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 77')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000077' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 78')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000078' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 79')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000079' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 80')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000080' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 81')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000081' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 82')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000082' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 83')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000083' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 84')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000084' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 85')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000085' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 86')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000086' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 87')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000087' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 88')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000088' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 89')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000089' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 90')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000090' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 91')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000091' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 92')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000092' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 93')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000093' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 94')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000094' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 95')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000095' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 96')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000096' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 97')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000097' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 98')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000098' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 99')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000099' --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 100')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:'vnd.android.cursor.item/phone_v2' --bind data1:s:'+33600000100' --bind data2:i:2 --bind raw_contact_id:l:$rid

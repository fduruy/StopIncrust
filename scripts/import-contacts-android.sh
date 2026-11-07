#!/bin/sh
# Auto-import 100 test contacts into the emulator contacts provider
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 1' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 1' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000001' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 2' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 2' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000002' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 3' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 3' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000003' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 4' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 4' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000004' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 5' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 5' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000005' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 6' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 6' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000006' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 7' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 7' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000007' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 8' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 8' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000008' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 9' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 9' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000009' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 10' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 10' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000010' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 11' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 11' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000011' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 12' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 12' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000012' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 13' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 13' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000013' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 14' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 14' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000014' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 15' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 15' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000015' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 16' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 16' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000016' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 17' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 17' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000017' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 18' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 18' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000018' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 19' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 19' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000019' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 20' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 20' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000020' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 21' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 21' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000021' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 22' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 22' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000022' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 23' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 23' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000023' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 24' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 24' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000024' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 25' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 25' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000025' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 26' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 26' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000026' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 27' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 27' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000027' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 28' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 28' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000028' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 29' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 29' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000029' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 30' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 30' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000030' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 31' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 31' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000031' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 32' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 32' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000032' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 33' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 33' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000033' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 34' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 34' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000034' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 35' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 35' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000035' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 36' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 36' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000036' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 37' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 37' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000037' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 38' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 38' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000038' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 39' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 39' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000039' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 40' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 40' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000040' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 41' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 41' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000041' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 42' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 42' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000042' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 43' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 43' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000043' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 44' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 44' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000044' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 45' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 45' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000045' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 46' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 46' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000046' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 47' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 47' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000047' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 48' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 48' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000048' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 49' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 49' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000049' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 50' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 50' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000050' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 51' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 51' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000051' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 52' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 52' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000052' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 53' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 53' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000053' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 54' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 54' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000054' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 55' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 55' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000055' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 56' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 56' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000056' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 57' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 57' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000057' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 58' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 58' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000058' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 59' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 59' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000059' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 60' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 60' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000060' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 61' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 61' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000061' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 62' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 62' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000062' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 63' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 63' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000063' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 64' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 64' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000064' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 65' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 65' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000065' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 66' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 66' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000066' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 67' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 67' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000067' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 68' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 68' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000068' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 69' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 69' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000069' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 70' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 70' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000070' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 71' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 71' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000071' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 72' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 72' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000072' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 73' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 73' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000073' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 74' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 74' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000074' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 75' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 75' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000075' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 76' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 76' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000076' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 77' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 77' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000077' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 78' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 78' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000078' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 79' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 79' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000079' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 80' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 80' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000080' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 81' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 81' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000081' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 82' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 82' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000082' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 83' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 83' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000083' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 84' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 84' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000084' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 85' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 85' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000085' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 86' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 86' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000086' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 87' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 87' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000087' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 88' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 88' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000088' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 89' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 89' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000089' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 90' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 90' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000090' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 91' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 91' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000091' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 92' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 92' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000092' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 93' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 93' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000093' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 94' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 94' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000094' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 95' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 95' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000095' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 96' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 96' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000096' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 97' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 97' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000097' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 98' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 98' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000098' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 99' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 99' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000099' --bind data2:2 --bind raw_contact_id:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:'Test User 100' --bind account_name:null --bind account_type:null)
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/name' --bind data1:'Test User 100' --bind raw_contact_id:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:'vnd.android.cursor.item/phone_v2' --bind data1:'+33600000100' --bind data2:2 --bind raw_contact_id:$rid

#!/bin/sh
# clean previous broken inserts (Test User %)
content delete --uri content://com.android.contacts/raw_contacts --where "display_name LIKE 'Test User %'"
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 1')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 1' --bind data2:s:User --bind data3:s:'Test User 1' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000001 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 2')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 2' --bind data2:s:User --bind data3:s:'Test User 2' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000002 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 3')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 3' --bind data2:s:User --bind data3:s:'Test User 3' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000003 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 4')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 4' --bind data2:s:User --bind data3:s:'Test User 4' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000004 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 5')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 5' --bind data2:s:User --bind data3:s:'Test User 5' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000005 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 6')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 6' --bind data2:s:User --bind data3:s:'Test User 6' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000006 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 7')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 7' --bind data2:s:User --bind data3:s:'Test User 7' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000007 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 8')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 8' --bind data2:s:User --bind data3:s:'Test User 8' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000008 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 9')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 9' --bind data2:s:User --bind data3:s:'Test User 9' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000009 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 10')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 10' --bind data2:s:User --bind data3:s:'Test User 10' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000010 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 11')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 11' --bind data2:s:User --bind data3:s:'Test User 11' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000011 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 12')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 12' --bind data2:s:User --bind data3:s:'Test User 12' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000012 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 13')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 13' --bind data2:s:User --bind data3:s:'Test User 13' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000013 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 14')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 14' --bind data2:s:User --bind data3:s:'Test User 14' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000014 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 15')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 15' --bind data2:s:User --bind data3:s:'Test User 15' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000015 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 16')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 16' --bind data2:s:User --bind data3:s:'Test User 16' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000016 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 17')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 17' --bind data2:s:User --bind data3:s:'Test User 17' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000017 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 18')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 18' --bind data2:s:User --bind data3:s:'Test User 18' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000018 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 19')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 19' --bind data2:s:User --bind data3:s:'Test User 19' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000019 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 20')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 20' --bind data2:s:User --bind data3:s:'Test User 20' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000020 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 21')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 21' --bind data2:s:User --bind data3:s:'Test User 21' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000021 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 22')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 22' --bind data2:s:User --bind data3:s:'Test User 22' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000022 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 23')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 23' --bind data2:s:User --bind data3:s:'Test User 23' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000023 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 24')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 24' --bind data2:s:User --bind data3:s:'Test User 24' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000024 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 25')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 25' --bind data2:s:User --bind data3:s:'Test User 25' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000025 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 26')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 26' --bind data2:s:User --bind data3:s:'Test User 26' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000026 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 27')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 27' --bind data2:s:User --bind data3:s:'Test User 27' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000027 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 28')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 28' --bind data2:s:User --bind data3:s:'Test User 28' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000028 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 29')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 29' --bind data2:s:User --bind data3:s:'Test User 29' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000029 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 30')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 30' --bind data2:s:User --bind data3:s:'Test User 30' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000030 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 31')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 31' --bind data2:s:User --bind data3:s:'Test User 31' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000031 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 32')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 32' --bind data2:s:User --bind data3:s:'Test User 32' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000032 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 33')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 33' --bind data2:s:User --bind data3:s:'Test User 33' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000033 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 34')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 34' --bind data2:s:User --bind data3:s:'Test User 34' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000034 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 35')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 35' --bind data2:s:User --bind data3:s:'Test User 35' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000035 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 36')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 36' --bind data2:s:User --bind data3:s:'Test User 36' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000036 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 37')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 37' --bind data2:s:User --bind data3:s:'Test User 37' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000037 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 38')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 38' --bind data2:s:User --bind data3:s:'Test User 38' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000038 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 39')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 39' --bind data2:s:User --bind data3:s:'Test User 39' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000039 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 40')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 40' --bind data2:s:User --bind data3:s:'Test User 40' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000040 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 41')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 41' --bind data2:s:User --bind data3:s:'Test User 41' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000041 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 42')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 42' --bind data2:s:User --bind data3:s:'Test User 42' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000042 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 43')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 43' --bind data2:s:User --bind data3:s:'Test User 43' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000043 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 44')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 44' --bind data2:s:User --bind data3:s:'Test User 44' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000044 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 45')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 45' --bind data2:s:User --bind data3:s:'Test User 45' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000045 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 46')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 46' --bind data2:s:User --bind data3:s:'Test User 46' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000046 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 47')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 47' --bind data2:s:User --bind data3:s:'Test User 47' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000047 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 48')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 48' --bind data2:s:User --bind data3:s:'Test User 48' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000048 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 49')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 49' --bind data2:s:User --bind data3:s:'Test User 49' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000049 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 50')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 50' --bind data2:s:User --bind data3:s:'Test User 50' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000050 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 51')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 51' --bind data2:s:User --bind data3:s:'Test User 51' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000051 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 52')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 52' --bind data2:s:User --bind data3:s:'Test User 52' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000052 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 53')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 53' --bind data2:s:User --bind data3:s:'Test User 53' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000053 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 54')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 54' --bind data2:s:User --bind data3:s:'Test User 54' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000054 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 55')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 55' --bind data2:s:User --bind data3:s:'Test User 55' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000055 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 56')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 56' --bind data2:s:User --bind data3:s:'Test User 56' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000056 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 57')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 57' --bind data2:s:User --bind data3:s:'Test User 57' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000057 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 58')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 58' --bind data2:s:User --bind data3:s:'Test User 58' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000058 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 59')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 59' --bind data2:s:User --bind data3:s:'Test User 59' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000059 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 60')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 60' --bind data2:s:User --bind data3:s:'Test User 60' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000060 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 61')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 61' --bind data2:s:User --bind data3:s:'Test User 61' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000061 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 62')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 62' --bind data2:s:User --bind data3:s:'Test User 62' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000062 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 63')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 63' --bind data2:s:User --bind data3:s:'Test User 63' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000063 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 64')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 64' --bind data2:s:User --bind data3:s:'Test User 64' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000064 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 65')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 65' --bind data2:s:User --bind data3:s:'Test User 65' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000065 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 66')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 66' --bind data2:s:User --bind data3:s:'Test User 66' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000066 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 67')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 67' --bind data2:s:User --bind data3:s:'Test User 67' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000067 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 68')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 68' --bind data2:s:User --bind data3:s:'Test User 68' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000068 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 69')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 69' --bind data2:s:User --bind data3:s:'Test User 69' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000069 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 70')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 70' --bind data2:s:User --bind data3:s:'Test User 70' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000070 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 71')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 71' --bind data2:s:User --bind data3:s:'Test User 71' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000071 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 72')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 72' --bind data2:s:User --bind data3:s:'Test User 72' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000072 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 73')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 73' --bind data2:s:User --bind data3:s:'Test User 73' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000073 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 74')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 74' --bind data2:s:User --bind data3:s:'Test User 74' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000074 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 75')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 75' --bind data2:s:User --bind data3:s:'Test User 75' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000075 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 76')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 76' --bind data2:s:User --bind data3:s:'Test User 76' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000076 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 77')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 77' --bind data2:s:User --bind data3:s:'Test User 77' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000077 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 78')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 78' --bind data2:s:User --bind data3:s:'Test User 78' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000078 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 79')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 79' --bind data2:s:User --bind data3:s:'Test User 79' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000079 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 80')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 80' --bind data2:s:User --bind data3:s:'Test User 80' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000080 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 81')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 81' --bind data2:s:User --bind data3:s:'Test User 81' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000081 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 82')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 82' --bind data2:s:User --bind data3:s:'Test User 82' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000082 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 83')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 83' --bind data2:s:User --bind data3:s:'Test User 83' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000083 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 84')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 84' --bind data2:s:User --bind data3:s:'Test User 84' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000084 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 85')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 85' --bind data2:s:User --bind data3:s:'Test User 85' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000085 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 86')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 86' --bind data2:s:User --bind data3:s:'Test User 86' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000086 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 87')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 87' --bind data2:s:User --bind data3:s:'Test User 87' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000087 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 88')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 88' --bind data2:s:User --bind data3:s:'Test User 88' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000088 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 89')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 89' --bind data2:s:User --bind data3:s:'Test User 89' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000089 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 90')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 90' --bind data2:s:User --bind data3:s:'Test User 90' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000090 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 91')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 91' --bind data2:s:User --bind data3:s:'Test User 91' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000091 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 92')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 92' --bind data2:s:User --bind data3:s:'Test User 92' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000092 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 93')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 93' --bind data2:s:User --bind data3:s:'Test User 93' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000093 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 94')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 94' --bind data2:s:User --bind data3:s:'Test User 94' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000094 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 95')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 95' --bind data2:s:User --bind data3:s:'Test User 95' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000095 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 96')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 96' --bind data2:s:User --bind data3:s:'Test User 96' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000096 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 97')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 97' --bind data2:s:User --bind data3:s:'Test User 97' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000097 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 98')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 98' --bind data2:s:User --bind data3:s:'Test User 98' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000098 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 99')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 99' --bind data2:s:User --bind data3:s:'Test User 99' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000099 --bind data2:i:2 --bind raw_contact_id:l:$rid
uri=$(content insert --uri content://com.android.contacts/raw_contacts --bind display_name:s:'Test User 100')
rid=${uri##*/}
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/name --bind data1:s:'Test User 100' --bind data2:s:User --bind data3:s:'Test User 100' --bind raw_contact_id:l:$rid
content insert --uri content://com.android.contacts/data --bind mimetype:s:vnd.android.cursor.item/phone_v2 --bind data1:s:+33600000100 --bind data2:i:2 --bind raw_contact_id:l:$rid

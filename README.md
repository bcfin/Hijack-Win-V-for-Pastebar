# Hijack Win+V สำหรับ Pastebar

โปรเจกต์นี้เป็นสคริปต์ AutoHotkey ที่ช่วยให้คุณเปลี่ยนแปลงพฤติกรรมของปุ่มลัด `Win+V` จากการเปิดคลิปบอร์ดประวัติเริ่มต้นของ Windows ให้กลายเป็นการเปิด Pastebar แทน ซึ่งเป็นแอปพลิเคชันจัดการคลิปบอร์ดที่ทรงพลัง

## ภาพรวม

เมื่อคุณกด `Win+V` สคริปต์นี้จะ:
1. ป้องกันการเปิดเมนู Start ขึ้นมา
2. รอให้ปุ่ม Win ถูกปล่อยออก
3. ส่งปุ่มลัดที่กำหนดไปยัง Pastebar (โดยค่าเริ่มต้นคือ `Ctrl+Shift+Q`)

## ข้อกำหนดเบื้องต้น

ก่อนที่จะเริ่มใช้งาน คุณต้องมีสิ่งต่อไปนี้:
- Windows 10 หรือใหม่กว่า
- แอปพลิเคชัน [Pastebar](https://pastebar.app/) (ฟรี)
- [AutoHotkey v2](https://www.autohotkey.com/) (ฟรี)

## ขั้นตอนการติดตั้ง

### 1. ติดตั้ง Pastebar

1. ไปที่เว็บไซต์ [pastebar.app](https://pastebar.app/)
2. ดาวน์โหลดและติดตั้ง Pastebar
3. เปิด Pastebar และตั้งค่าปุ่มลัดสำหรับการเปิดแอป (แนะนำให้ใช้ `Ctrl+Shift+Q`)
   - ใน Pastebar ไปที่ Settings > Shortcuts
   - ตั้งค่า Global shortcut สำหรับ "Show Pastebar" เป็น `Ctrl+Shift+Q`

### 2. ติดตั้ง AutoHotkey v2

1. ไปที่เว็บไซต์ [autohotkey.com](https://www.autohotkey.com/)
2. ดาวน์โหลด AutoHotkey v2 (เวอร์ชันล่าสุด)
3. ติดตั้งโดยทำตามคำแนะนำบนหน้าจอ
4. หลังจากติดตั้งเสร็จ ให้ตรวจสอบว่าติดตั้งถูกต้องโดยเปิด Command Prompt และพิมพ์ `ahk` เพื่อดูว่าปรากฏขึ้นมา

### 3. ดาวน์โหลดและรันสคริปต์

1. ดาวน์โหลดไฟล์ `Hijack Win+V for Pastebar.ahk` จากโปรเจกต์นี้
2. วางไฟล์ไว้ในโฟลเดอร์ที่คุณต้องการ (แนะนำให้ใช้โฟลเดอร์ Documents หรือ Desktop)
3. คลิกขวาที่ไฟล์และเลือก "Run Script" หรือเปิดด้วย AutoHotkey

**หมายเหตุ:** สคริปต์นี้ต้องรันด้วยสิทธิ์ Administrator เพราะต้องเข้าถึงระบบระดับล่าง

## การกำหนดค่า

### ปรับแต่งปุ่มลัด

โดยค่าเริ่มต้น สคริปต์จะส่ง `Ctrl+Shift+Q` ไปยัง Pastebar หากคุณต้องการเปลี่ยนแปลง:

1. เปิดไฟล์ `Hijack Win+V for Pastebar.ahk` ด้วยโปรแกรมแก้ไขข้อความ
2. หาโค้ดบรรทัดที่ 15:
   ```
   TargetShortcut := "^+Q"  ; Ctrl+Shift+Q (customize as needed)
   ```
3. เปลี่ยน `^+Q` เป็นปุ่มลัดที่คุณต้องการ
   - `^` = Ctrl
   - `+` = Shift
   - `!` = Alt
   - `#` = Win
   - เช่น หากต้องการ `Ctrl+Alt+P` ให้เปลี่ยนเป็น `^!P`

4. บันทึกไฟล์และรีสตาร์ทสคริปต์

## ตั้งค่า Auto Startup

เพื่อให้สคริปต์ทำงานอัตโนมัติทุกครั้งที่เปิดเครื่อง:

### วิธีที่ 1: ใช้ Task Scheduler (แนะนำ)

1. ค้นหา "Task Scheduler" ในช่องค้นหาของ Windows และเปิดขึ้นมา
2. คลิก "Create Task..." ในแผงด้านขวา
3. ในแท็บ General:
   - ชื่อ: "Hijack Win+V for Pastebar"
   - เลือก "Run with highest privileges"
   - เลือก "Run only when user is logged on" (หรือตามที่คุณต้องการ)
4. ในแท็บ Triggers:
   - คลิก "New..."
   - เลือก "At log on" และเลือกผู้ใช้ของคุณ
5. ในแท็บ Actions:
   - คลิก "New..."
   - Action: "Start a program"
   - Program/script: พิมพ์ `C:\Program Files\AutoHotkey\v2\AutoHotkey64.exe`
   - Add arguments: พิมพ์เส้นทางเต็มไปยังไฟล์สคริปต์ของคุณ (เช่น `C:\Users\YourUsername\Desktop\Hijack Win+V for Pastebar.ahk`)
6. คลิก "OK" เพื่อบันทึก

### วิธีที่ 2: วางไฟล์ใน Startup Folder

1. กด `Win+R` และพิมพ์ `shell:startup` แล้วกด Enter
2. คัดลอกไฟล์ `.ahk` ไปวางในโฟลเดอร์ที่เปิดขึ้นมา
3. สร้างไฟล์ batch ใหม่ชื่อ `start_pastebar.bat` และใส่โค้ดนี้:
   ```
   @echo off
   "C:\Program Files\AutoHotkey\v2\AutoHotkey64.exe" "C:\Path\To\Your\Script.ahk"
   ```
   (เปลี่ยนเส้นทางให้ถูกต้อง)
4. วางไฟล์ `.bat` ไว้ใน Startup folder แทนไฟล์ `.ahk`

## การใช้งาน

หลังจากตั้งค่าทุกอย่างเสร็จ:
1. รีสตาร์ทคอมพิวเตอร์หรือล็อกอินใหม่
2. กด `Win+V` และจะเปิด Pastebar แทนคลิปบอร์ดประวัติของ Windows

## การแก้ปัญหา

### สคริปต์ไม่ทำงาน
- ตรวจสอบว่าติดตั้ง AutoHotkey v2 ถูกต้อง
- ตรวจสอบว่าสคริปต์รันด้วยสิทธิ์ Administrator
- ตรวจสอบไฟล์สคริปต์ว่ามีการเปลี่ยนแปลงหรือไม่

### Win+V ยังเปิดคลิปบอร์ด Windows อยู่
- ตรวจสอบว่าปุ่มลัดใน Pastebar ตั้งค่าให้ตรงกับ `TargetShortcut` ในสคริปต์
- ลองรีสตาร์ทสคริปต์หรือคอมพิวเตอร์

### ไม่สามารถรันด้วยสิทธิ์ Admin
- คลิกขวาที่ไฟล์สคริปต์และเลือก "Run as administrator"
- หรือเพิ่มใน Task Scheduler ตามที่อธิบายด้านบน

## เคล็ดลับเพิ่มเติม

- คุณสามารถหยุดสคริปต์ได้โดยคลิกขวาที่ไอคอน AutoHotkey ใน System Tray และเลือก "Exit"
- หากต้องการแก้ไขสคริปต์ ให้ใช้โปรแกรมแก้ไขข้อความธรรมดา
- สำรองไฟล์สคริปต์ไว้เสมอก่อนทำการเปลี่ยนแปลง

## การสนับสนุน

หากพบปัญหาหรือมีคำถาม สามารถ:
- ตรวจสอบเอกสารของ AutoHotkey ที่ [autohotkey.com/docs](https://www.autohotkey.com/docs/)
- ติดต่อชุมชน AutoHotkey ที่ [autohotkey.com/boards](https://www.autohotkey.com/boards/)

---

**หมายเหตุ:** โปรเจกต์นี้เป็นโอเพนซอร์สและไม่มีประกันใดๆ การใช้งานเป็นความเสี่ยงของคุณเอง

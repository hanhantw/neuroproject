  功能：
	CKIP中研院斷詞結果去除括號及POS tag、處理標點符號

注意：
  1. 所有TXT檔請先改為utf-8編碼
  2. 每次執行，輸出的資料夾內容會被覆蓋

執行：
  1. 把要斷好詞的檔案放在同一個資料夾 (ex: input_dir)
  2. 執行 ./ckip.sh input_dir output_dir
  3. 處理完的檔案會在output_dir，檔名會對應 (注意：每次執行output_dir將會重寫)
   
FAQ：
	如有出現：permission denied: ./<xxx>.sh
	請下指令：chmod 755 ckip.sh


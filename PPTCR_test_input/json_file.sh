# API update
echo "API update"
python json_file.py --dataset Create_new_slides --label_path PPTCR/test/short/api_labels.txt --instruction_path PPTCR/test/short/instructions.txt --save_dir PPTCR/PPTCR_test_input/API_update
python json_file.py --dataset Edit_PPT_template --label_path PPTCR/test/long/api_labels.txt --instruction_path PPTCR/test/long/instructions.txt --save_dir PPTCR/PPTCR_test_input/API_update

# API lack
echo "API lack"
python json_file.py --dataset Create_new_slides --label_path PPTCR/test/short/api_labels.txt --instruction_path PPTCR/test/short/instructions.txt --save_dir PPTCR/PPTCR_test_input/API_lack
python json_file.py --dataset Edit_PPT_template --label_path PPTCR/test/long/api_labels.txt --instruction_path PPTCR/test/long/instructions.txt --save_dir PPTCR/PPTCR_test_input/API_lack

# Language
echo "Language"
for l in Arabic Bulgarian Chinese French German Greek Hindi Russian Spanish Swahili Thai Turkish Urdu Vietnamese; do 
    echo ${l}
    python json_file.py --dataset  Create_new_slides --label_path PPTCR/test/short/languages/${l}_api_labels.txt --instruction_path PPTCR/test/short/languages/${l}_instructions.txt --save_dir PPTCR/PPTCR_test_input/Language/${l} 
    python json_file.py --dataset  Edit_PPT_template --label_path PPTCR/test/long/languages/${l}_api_labels.txt --instruction_path PPTCR/test/long/languages/${l}_instructions.txt --save_dir PPTCR/PPTCR_test_input/Language/${l} 
done

# Robust
echo "Robust"
for i in 0 1 2 3; do
    python json_file.py --dataset Create_new_slides --label_path PPTCR/test/short/api_labels.txt --instruction_path PPTCR/test/short/robust${i}.txt --save_dir PPTCR/PPTCR_test_input/Robust/${i}
    python json_file.py --dataset Edit_PPT_template --label_path PPTCR/test/long/api_labels.txt --instruction_path PPTCR/test/long/robust${i}.txt --save_dir PPTCR/PPTCR_test_input/Robust/${i}
done

# Noisy
echo "Noisy"
python json_file.py --dataset Create_new_slides --label_path PPTCR/test/short/api_labels.txt --instruction_path PPTCR/test/short/noisy.txt --save_dir PPTCR/PPTCR_test_input/Noisy
python json_file.py --dataset Edit_PPT_template --label_path PPTCR/test/long/api_labels.txt --instruction_path PPTCR/test/long/noisy.txt --save_dir PPTCR/PPTCR_test_input/Noisy
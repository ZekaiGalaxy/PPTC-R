import json
import jsonlines
import os
import argparse

def mkdir(path):
    isExists = os.path.exists(path)
    if not isExists:
        os.makedirs(path)

def main(args):
    set_name = args.dataset
    label_path = args.label_path
    instruction_path = args.instruction_path
    save_dir = args.save_dir

    session_labels = {}

    with open(label_path, 'r', encoding="utf8") as file:
        content = file.read()
    sessions = content.strip().split('\n\n')
    for session_id, session in enumerate(sessions):
        session_labels[session_id] = []
        lines = session.strip().split('\n')
        for line in lines:
            session_labels[session_id].append(line)

    with open(instruction_path, 'r', encoding="utf8") as file:
        content = file.read()

    sessions = content.strip().split('\n\n')
    for session_id, session in enumerate(sessions):
        lines = session.strip().split('\n')
        for line_id, line in enumerate(lines):
            mkdir(f"{save_dir}/{set_name}")
            with jsonlines.open(f"{save_dir}/{set_name}/session_{session_id}.json", mode='a') as writer:
                data = {
                    'Turn': line_id,
                    'User instruction': line,
                    'Feasible API sequence': session_labels[session_id][line_id],
                    'Base File': f'PPT_Base_File/{save_dir.split("/")[-1]}/{set_name}/{session_id}_{line_id}.pptx',
                    'Label File': f'PPT_Label_File/{save_dir.split("/")[-1]}/{set_name}/{session_id}_{line_id}.pptx'
                }
                writer.write(data)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Process PPT data")
    parser.add_argument('--dataset', type=str, required=True, help='Dataset name (e.g., Edit_PPT_template or Create_new_slides)')
    parser.add_argument('--label_path', type=str, required=True, help='Path to the label file')
    parser.add_argument('--instruction_path', type=str, required=True, help='Path to the instruction file')
    parser.add_argument('--save_dir', type=str, required=True, help='Directory to save the output files')
    args = parser.parse_args()
    main(args)

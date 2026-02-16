import os

def update_html_references():
    docs_dir = r"x:\assorted\obsidian\assorted\links\tasks\(main)(website) k-church-project\docs"
    target_string = "images/church-logo.jpeg"
    replacement_string = "images/church-logo.png"

    for filename in os.listdir(docs_dir):
        if filename.endswith(".html"):
            filepath = os.path.join(docs_dir, filename)
            try:
                with open(filepath, "r", encoding="utf-8") as f:
                    content = f.read()
                
                if target_string in content:
                    new_content = content.replace(target_string, replacement_string)
                    with open(filepath, "w", encoding="utf-8") as f:
                        f.write(new_content)
                    print(f"Updated {filename}")
                else:
                    print(f"No changes needed for {filename}")
            except Exception as e:
                print(f"Error processing {filename}: {e}")

if __name__ == "__main__":
    update_html_references()

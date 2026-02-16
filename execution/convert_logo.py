from PIL import Image
import os

def convert_logo():
    source_path = r"x:\assorted\obsidian\assorted\links\tasks\(main)(website) k-church-project\docs\images\church-logo.jpeg"
    dest_path = r"x:\assorted\obsidian\assorted\links\tasks\(main)(website) k-church-project\docs\images\church-logo.png"

    try:
        img = Image.open(source_path)
        img = img.convert("RGBA")
        datas = img.getdata()

        new_data = []
        for item in datas:
            # Change all white (also shades of whites)
            # to transparent
            if item[0] > 200 and item[1] > 200 and item[2] > 200:
                new_data.append((255, 255, 255, 0))
            else:
                new_data.append(item)

        img.putdata(new_data)
        img.save(dest_path, "PNG")
        print(f"Successfully converted {source_path} to {dest_path}")
    except Exception as e:
        print(f"Error converting logo: {e}")

if __name__ == "__main__":
    convert_logo()

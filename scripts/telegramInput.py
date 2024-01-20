#!/usr/bin/env python3
import telegram
from telegram.ext import Updater, CommandHandler

# Your API token from BotFather
TOKEN = '6257369742:AAH9txtEePHdVyK_-MyINAwVKokZa2xn3GY'

# Path to your input file
INPUT_FILE_PATH = '/home/jai/Documents/automations/inputDomains.txt'
INPUT_NUCLEI_FILE_PATH = '/home/jai/Documents/automations/nucleiInputDomains.txt'
COMPLETED_SUB_ENUM_FILE_PATH = '/home/jai/Documents/automations/completed_subenum_domains.txt'

def start(update, context):
    update.message.reply_text('Bot is ready to receive subdomains.')

def process_subdomain(update, context):
    # Get the subdomain from the incoming message
    subdomain = context.args[0]

    # Append the subdomain to the input file
    with open(INPUT_FILE_PATH, 'a') as file:
        file.write(subdomain + '\n')

    update.message.reply_text(f'Subdomain "{subdomain}" added to the input file.')

def process_nuclei(update, context):
    # Get the subdomain from the incoming message
    subdomain = context.args[0]

    # Append the subdomain to the input file
    with open(INPUT_NUCLEI_FILE_PATH, 'a') as file:
        file.write(subdomain + '\n')

    update.message.reply_text(f'Nuclei Subdomain "{subdomain}" added to the input file.')

def get_completed_subdomains_txt(update, context):
    with open(COMPLETED_SUB_ENUM_FILE_PATH, 'r') as file:
    	completed_subs = file.read()
    
    update.message.reply_text('Completed subdomains : \n ' + completed_subs)
    

def main():
    updater = Updater(TOKEN, use_context=True)
    dp = updater.dispatcher

    # Register command handlers
    dp.add_handler(CommandHandler("start", start))
    dp.add_handler(CommandHandler("add_sub", process_subdomain, pass_args=True))
    dp.add_handler(CommandHandler("comp_sub", get_completed_subdomains_txt))
    dp.add_handler(CommandHandler("add_nuclei", process_nuclei, pass_args=True))
    
	
    # Start the Bot
    updater.start_polling()
    updater.idle()

if __name__ == '__main__':
    main()

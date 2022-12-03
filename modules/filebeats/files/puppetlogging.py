from os.path import exists
import re
from datetime import datetime
import hashlib

def check_file():
    output_file = r'/tmp/logs/puppet_run_summary.log'
    with open(output_file, 'a') as f:
        f.write(get_last_run_info())

def get_last_run_info():
    input_file= r'/opt/puppetlabs/puppet/public/last_run_summary.yaml'
    output_file = r'/tmp/logs/puppet_run_summary.log'
    with open(input_file, 'r', encoding='UTF-8') as f:
        lines = f.readlines()

    line_to_log_1 = f"'{datetime.now()}' - last_run_info -"

    for num, line in enumerate(lines):
        if re.search("resources:\s", line):
            line_to_log_1 += f'{lines[num + 1][0:-1]}'
            line_to_log_1 += f'{lines[num + 2][0:-1]}'
            line_to_log_1 += f'{lines[num + 3][0:-1]}'
            line_to_log_1 += f'{lines[num + 4][0:-1]}'
            line_to_log_1 += f'{lines[num + 5][0:-1]}'
            line_to_log_1 += f'{lines[num + 6][0:-1]}'
            line_to_log_1 += f'{lines[num + 7][0:-1]}'
    line_to_return = f'{line_to_log_1}'
    return line_to_return

if __name__ == '__main__':
    check_file()
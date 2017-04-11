#!/usr/bin/env python3

import os
import yaml
import operator

template_directory = './template/'

def gentable(d, file=None):
    out = '.{} ({})\n'.format(d.get('description'), file)

    out += '[cols="3",options="header"]\n'

    out += '|====\n|Name |Type |Default\n'

    for name, param in sorted(d['parameters'].items(), key=operator.itemgetter(0)):
        out += '|{} |{} |{}\n'.format(name, param.get('type'), param.get('default'))

    out += '|====\n'

    print(out)

for template_file in os.listdir(template_directory):
    if (template_file.endswith('.yaml') or template_file.endswith('*.yml')):

        f = open(template_directory + template_file)
        d = yaml.load(f)
        gentable(d, template_file)
        f.close()


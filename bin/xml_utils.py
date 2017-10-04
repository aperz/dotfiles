#!/usr/bin/env python3

import xml.etree.ElementTree as ET
from lxml import etree, html
import pandas as pd

xml_data = '/path/user_agents.xml'

def xml2df(xml_data):
    tree = ET.parse(xml_data)
    root = tree.getroot()[1][0]
    all_records = []
    headers = []
    for i, child in enumerate(root):
        record = []
        for subchild in child:
            record.append(subchild.text)
            if subchild.tag not in headers:
                headers.append(subchild.tag)
        all_records.append(record)
    return pd.DataFrame(all_records, columns=headers)




def unnest_dicts(dictodicts):
    # return a list of OrderedDicts
    pass

def xml2df(xml_url, colname_name='TAG', value_name='VALUE'):
    pass
    #s = requests.get(xml_url).content
    #root = s.getroottree()
    #xmltodict.parse(s.content)
    # unnest_dicts
    # for each TAG get VALUE -> df row

#   header:
#    for i,c in enumerate(root[1][0][0]):
#        for c_ in c:
#            print(c_.text)

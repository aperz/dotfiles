import argparse
import os
from bs4 import BeautifulSoup

# for a more elegant solution: https://gist.github.com/damianavila/5305869

#TODO: convert from ipynb not html
# jupyter nbconvert --to html report.ipynb

def clean_html(filestr):
    soup = BeautifulSoup(filestr, 'html.parser')

    # remove prompts
    for div in soup.find_all("div", {'class':'prompt'}):
        div.decompose()
    # remove code input cells
    for div in soup.find_all("div", {'class':'highlight'}):
        div.decompose()
    # remove the paragraph links
    for div in soup.find_all("a", {'class':'anchor-link'}):
        div.decompose()

    #return render_template_string(soup.decode())
    return soup.decode()


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="\
                        ")
    parser.add_argument("-i", "--input_fp",
                        required=True)
    args = vars(parser.parse_args())

    input_fp = args['input_fp']
    output_fp = os.path.splitext(input_fp)[0]+"_modified.html"

    with open(input_fp, "r") as f:
        filestr = f.read()

    o = clean_html(filestr)

    with open(output_fp, "w") as ofp:
        ofp.write(o)

   # view_wrapper = {
   #     "start" :
   #         """\r
   #         {% extends 'layouts/main.html' %}\;
   #         {% block title %}PubQC{% endblock %}\r
   #         {% block content %}\r
   #         \n""",
   #     "end" :
   #         """\r<br>
   #         <hr class='separator-horizontal'></hr>\r
   #         <div class='footnote'>This report page was created using Jupyter Notebook.</div>\r
   #         {% endblock %}\r
   #         \r"""
   #         }
   # filestr = view_wrapper['start']+filestr+view_wrapper['end']

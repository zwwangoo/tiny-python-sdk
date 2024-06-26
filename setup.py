from codecs import open
from setuptools import setup, find_packages


with open('README.rst', 'r', 'utf-8') as f:
    readme = f.read()

setup(
    name='tiny_python_sdk',
    version='1.0.1',
    url='https://github.com/zwwangoo/tiny-python-sdk',
    long_description=readme,
    long_description_content_type='text/x-rst',
    author='zwwangoo',
    author_email='w_angzhiwen@163.com',
    packages=find_packages(exclude=('tests', 'tests.*')),
    zip_safe=False,
    include_package_data=True,
    python_requires='>=3.5',
    classifiers=[
        'Programming Language :: Python :: 3.5',
        'Programming Language :: Python :: 3.6',
        'Programming Language :: Python :: 3.7',
        'Programming Language :: Python :: 3.11',
    ],
    entry_points={
        'console_scripts': [
            'tiny_python_sdk = tiny_python_sdk.helper.cpu:run_print'
        ]
    }

)

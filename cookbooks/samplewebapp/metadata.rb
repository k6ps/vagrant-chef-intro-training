name             'samplewebapp'
maintainer       'Nortal'
maintainer_email 'sampler@somecompany.com'
license          'All rights reserved'
description      'Installs platform for SampleWebApp'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'

depends 'java', '~> 1.31.0'
depends 'mongodb', '~> 0.16.2'

baseline
baseline: spec
  <baseline>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'baseline'.
      spec
        package: 'Grease-Core';
        package: 'Grease-Tests-Core' with: [ spec requires: #('Grease-Core') ].
      spec
        group: 'Core' with: #('Grease-Core');
        group: 'Core Tests' with: #('Grease-Tests-Core');
        group: 'Slime' with: #('Core');
        group: 'Slime Tests' with: #('Core Tests');
        group: 'Tests' with: #('Core Tests' 'Slime Tests');
        group: 'default' with: #('Slime') ].
  spec
    for: #'pharo3.x'
    do: [ 
      spec
        package: 'Grease-Core'
          with: [ spec includes: #('Grease-Pharo30-Core') ];
        package: 'Grease-Tests-Core'
          with: [ spec includes: #('Grease-Tests-Pharo20-Core') ];
        package: 'Grease-Pharo30-Core'
          with: [ spec requires: #('Grease-Core') ];
        package: 'Grease-Tests-Pharo20-Core'
          with: [ spec requires: #('Grease-Tests-Core') ];
        package: 'Grease-Slime' with: [ spec requires: #('Grease-Core') ];
        package: 'Grease-Tests-Slime'
          with: [ spec requires: #('Grease-Slime') ].
      spec
        group: 'Slime' with: #('Grease-Slime');
        group: 'Slime Tests' with: #('Grease-Tests-Slime') ].
  spec
    for: #'pharo2.x'
    do: [ 
      spec
        package: 'Grease-Core'
          with: [ spec includes: #('Grease-Pharo20-Core') ];
        package: 'Grease-Tests-Core'
          with: [ spec includes: #('Grease-Tests-Pharo20-Core') ];
        package: 'Grease-Pharo20-Core'
          with: [ spec requires: #('Grease-Core') ];
        package: 'Grease-Tests-Pharo20-Core'
          with: [ spec requires: #('Grease-Tests-Core') ].
      self slimeForSqueakPharo1xPharo2x: spec ].
  spec
    for: #'pharo1.x'
    do: [ 
      self greaseCoreAndTestsForSqueakAndPharo1x: spec.
      self slimeForSqueakPharo1xPharo2x: spec ].
  spec
    for: #'pharo1.1'
    do: [ 
      spec
        package: 'Grease-Pharo-Core'
        with: [ spec includes: #('Grease-Pharo11-Core') ] ].
  spec
    for: #'pharo1.0'
    do: [ 
      spec
        package: 'Grease-Pharo-Core'
        with: [ spec includes: #('Grease-Pharo10-Core' 'Grease-Pharo11-Core') ] ].
  spec
    for: #'squeak'
    do: [ 
      self greaseCoreAndTestsForSqueakAndPharo1x: spec.
      self slimeForSqueakPharo1xPharo2x: spec ].
  spec
    for: #'gemstone'
    do: [ 
      spec
        project: 'GsCore'
          with: [ 
              spec
                className: 'ConfigurationOfGsCore';
                versionString: #'stable';
                repository: 'http://seaside.gemstone.com/ss/MetacelloRepository' ];
        project: 'UTF8'
          with: [ 
              spec
                className: 'ConfigurationOfGsMisc';
                versionString: #'stable';
                loads: #('Utf8Encoding');
                repository: 'http://seaside.gemstone.com/ss/MetacelloRepository' ];
        project: 'System-Digital-Signatures'
          copyFrom: 'UTF8'
          with: [ spec loads: #('System-Digital-Signatures') ];
        project: 'SMTPMail'
          copyFrom: 'UTF8'
          with: [ spec loads: #('SMTPMail') ].
      spec
        package: 'Grease-Core'
          with: [ 
              spec
                requires: #('GsCore');
                includes: #('Grease-GemStone-Core') ];
        package: 'Grease-Tests-Core'
          with: [ spec includes: #('Grease-Tests-GemStone-Core') ];
        package: 'Grease-GemStone-Core'
          with: [ 
              spec
                requires:
                  #('Grease-Core' 'GsCore' 'System-Digital-Signatures' 'UTF8' 'SMTPMail') ];
        package: 'Grease-Tests-GemStone-Core'
          with: [ spec requires: #('Grease-Tests-Core') ] ].
  spec
    for: #'gs2.x'
    do: [ 
      spec
        package: 'Grease-GemStone-Core'
          with: [ spec includes: #('Grease-GemStone200-Core') ];
        package: 'Grease-GemStone200-Core'
          with: [ spec requires: #('Grease-GemStone-Core') ] ].
  spec
    for: #'gs2.3.x'
    do: [ 
      spec
        package: 'Grease-GemStone-Core'
          with: [ spec includes: #('Grease-GemStone230-Core') ];
        package: 'Grease-GemStone230-Core'
          with: [ spec requires: #('Grease-GemStone-Core') ] ].
  spec
    for: #'gs2.4.x'
    do: [ 
      spec
        package: 'Grease-GemStone-Core'
          with: [ spec includes: #('Grease-GemStone240-Core') ];
        package: 'Grease-GemStone240-Core'
          with: [ spec requires: #('Grease-GemStone-Core') ] ].
  spec
    for: #'gs3.x'
    do: [ 
      spec
        package: 'Grease-GemStone-Core'
          with: [ spec includes: #('Grease-GemStone300-Core') ];
        package: 'Grease-GemStone300-Core'
          with: [ spec requires: #('Grease-GemStone-Core') ] ].
  spec
    for: #'gs3.2.x'
    do: [ 
      spec
        package: 'Grease-Tests-GemStone-Core'
        with: [ spec file: 'Grease-Tests-GemStone-Core.v32' ] ]
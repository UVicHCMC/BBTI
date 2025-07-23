declare default element namespace "http://www.tei-c.org/ns/1.0";

declare variable $projHome external;

declare variable $col := collection($projHome || '/tei/?select=*.xml;recurse=yes');

declare variable $orgs as element(org)* := $col//org;

declare variable $summary as xs:string := 'Found ' || count($orgs) || ' in ' || count($col//TEI) || ' TEI files.';

declare variable $singleSources as xs:integer := count($orgs[count(descendant::bibl[@type='source'
]) eq 1]);

declare variable $multiSources as xs:integer := count($orgs[count(descendant::bibl[@type='source'
]) gt 1]);


declare variable $noSources as xs:integer := count($orgs[count(descendant::bibl[@type='source'
]) lt 1]);

$summary || '&#x0a;Records with single sources: ' || xs:string($singleSources)
|| '&#x0a;Records with multiple sources: ' || xs:string($multiSources)
|| '&#x0a;Records with no sources: ' || xs:string($noSources)


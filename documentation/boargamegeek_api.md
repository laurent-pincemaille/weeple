## Api
https://api.geekdo.com/xmlapi2

## Recherhcer liste de jeux

https://boardgamegeek.com/xmlapi2/search?type=boardgame&query=unl

```xml
<items total="152" termsofuse="https://boardgamegeek.com/xmlapi/termsofuse">
	<item type="boardgame" id="342218">
		<name type="primary" value="1914 Deluxe: Hell Unleashed"/>
		<yearpublished value="2021"/>
	</item>
	<item type="boardgame" id="220933">
		<name type="primary" value="Alien vs Predator: Unleashed"/>
		<yearpublished value="2017"/>
	</item>
</items>

etc ...
```

## Rechercher jeu en particulier avec un id
https://boardgamegeek.com/xmlapi/boardgame/342218



```xml
<boardgames termsofuse="https://boardgamegeek.com/xmlapi/termsofuse">
	<boardgame objectid="342218">
		<yearpublished>2021</yearpublished>
		<minplayers>2</minplayers>
		<maxplayers>2</maxplayers>
		<playingtime>0</playingtime>
		<minplaytime>0</minplaytime>
		<maxplaytime>0</maxplaytime>
		<age>12</age>
		<name primary="true" sortindex="1">1914 Deluxe: Hell Unleashed</name>
		<description>1914 Deluxe is an operational level hex-and-counter wargame that covers the first few months of the First World War when the German Army began its offensive into neighboring France. The German player must decide how best to perform the initial invasion. 
		</description>
		<thumbnail>https://cf.geekdo-images.com/x5CaAlInZF7Lb8pd_oql2w__thumb/img/rxVR_UnBDrS8JGgX0dBEpvtGiZ4=/fit-in/200x150/filters:strip_icc()/pic6272714.png</thumbnail>
		<image>https://cf.geekdo-images.com/x5CaAlInZF7Lb8pd_oql2w__original/img/CXJI99TpLkRDr5XGp3z4LxPtpUI=/0x0/filters:format(png)/pic6272714.png</image>
		<boardgamepublisher objectid="1991">Relative Range</boardgamepublisher>
		<boardgamefamily objectid="12226">Country: Belgium</boardgamefamily>
		<boardgamefamily objectid="11006">Country: France</boardgamefamily>
		<boardgamefamily objectid="10643">Country: Germany</boardgamefamily>
		<boardgamefamily objectid="14837">Country: Luxembourg</boardgamefamily>
		<boardgamefamily objectid="17056">Country: United Kingdom</boardgamefamily>
		<boardgamemechanic objectid="2072">Dice Rolling</boardgamemechanic>
		<boardgameversion objectid="661678">English boxed edition</boardgameversion>
		<boardgamemechanic objectid="2026">Hexagon Grid</boardgamemechanic>
		<boardgamedesigner objectid="2961">Mike Nagel</boardgamedesigner>
		<boardgameartist objectid="2961">Mike Nagel</boardgameartist>
		<boardgameversion objectid="570680">PDF English edition</boardgameversion>
		<boardgamefamily objectid="61979">Players: Two Player Only Games</boardgamefamily>
		<boardgamefamily objectid="72016">Players: Wargames with Rules Supporting Only Two Players</boardgamefamily>
		<boardgamecategory objectid="1120">Print & Play</boardgamecategory>
		<boardgamemechanic objectid="2070">Simulation</boardgamemechanic>
		<boardgamecategory objectid="1019">Wargame</boardgamecategory>
		<boardgamesubdomain objectid="4664">Wargames</boardgamesubdomain>
		<boardgamecategory objectid="1065">World War I</boardgamecategory>
		<boardgameimplementation objectid="4962" inbound="true">1914</boardgameimplementation>
		<poll name="suggested_numplayers" title="User Suggested Number of Players" totalvotes="3">
			<results numplayers="1">
				<result value="Best" numvotes="0"/>
				<result value="Recommended" numvotes="3"/>
				<result value="Not Recommended" numvotes="0"/>
			</results>
			<results numplayers="2">
				<result value="Best" numvotes="3"/>
				<result value="Recommended" numvotes="0"/>
				<result value="Not Recommended" numvotes="0"/>
			</results>
			<results numplayers="2+">
				<result value="Best" numvotes="0"/>
				<result value="Recommended" numvotes="2"/>
				<result value="Not Recommended" numvotes="1"/>
			</results>
		</poll>
		<poll name="language_dependence" title="Language Dependence" totalvotes="3">
			<results>
				<result level="1" value="No necessary in-game text" numvotes="0"/>
				<result level="2" value="Some necessary text - easily memorized or small crib sheet" numvotes="0"/>
				<result level="3" value="Moderate in-game text - needs crib sheet or paste ups" numvotes="3"/>
				<result level="4" value="Extensive use of text - massive conversion needed to be playable" numvotes="0"/>
				<result level="5" value="Unplayable in another language" numvotes="0"/>
			</results>
		</poll>
		<poll name="suggested_playerage" title="User Suggested Player Age" totalvotes="3">
			<results>
				<result value="2" numvotes="0"/>
				<result value="3" numvotes="0"/>
				<result value="4" numvotes="0"/>
				<result value="5" numvotes="0"/>
				<result value="6" numvotes="0"/>
				<result value="8" numvotes="0"/>
				<result value="10" numvotes="0"/>
				<result value="12" numvotes="0"/>
				<result value="14" numvotes="0"/>
				<result value="16" numvotes="3"/>
				<result value="18" numvotes="0"/>
				<result value="21 and up" numvotes="0"/>
			</results>
		</poll>
	</boardgame>
</boardgames>
```
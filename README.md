# ygo-edopro-customcards
archive for custom cards for edopro

ygo fabrica was used to make these.

You can download project.zip and place it into Edopro's expansions folder, or download ygo fabrica and generate the project.zip file yourself.

Coding snippets taken from already existing cards (I am no professional), but they should all work as written.

Images are from already-existing cards.

The first set (Favorite and - Transformation cards) are meant to be used in pure hero. They're meant to give you just a little bit more "Oomph". and in Kuriboh's case, a way to counter Nib.

The second set (- Change!!!) was developed later. These lock you into Masked and Elemental Heros, so no links or DPE, and so I tried to make them stronger, accordingly.
They revolve around the system of mask change, substituting a monster to summon. They have much easier access to adding cards to hand for material, and much easier access to gaining fusion and mask change cards.
Due to the limitation, they don't really have a great endboard, since most of the mask change targets aren't good, but they can still setup x3 chaos, and their gameplay is usually more consistent (less bricks, if you don't count mask change)

Quoting project.toml:

name = "Favorite: Change Polymerization"

effect = '''Fusion Summon 1 "Hero" monster using materials from your Extra Deck.
You can banish this card from your GY: Add one "Mask Change" or "Polymerization" from your GY to your hand.
You can only use each effect of "Favorite: Change Polymerization" once per turn.'''


name = "Favorite: Winged Kuriboh - Level 1"

effect = '''(This card is always treated as an "Elemental Hero" card.)
You can Special Summon this card (from your hand) by sending a "Polymerization" or "Change" card from your Deck to the GY.
You can tribute a "Hero" monster you control: Add one "Favorite" card from your Deck to your hand.
You can banish a "Polymerization" or "Change" card from your GY: Add this card from your GY to your hand.
You can only use each effect of "Favorite: Winged Kuriboh - Level 1" once per turn.'''


name = "Favorite: Winged Kuriboh - Level 8"

effect = '''(This card is always treated as an "Elemental Hero" card.)
You can Special Summon this card (from your hand) by banishing one "Kuriboh" monster from your GY.
If this card is Special Summoned: you can tribute this card: Special Summon one level 7 or lower "Hero" monster from your Deck.
You can banish this card from your GY in response to your opponent's monster effect: negate that effect.'
You can only use each effect of "Favorite: Winged Kuriboh - Level 8" once per duel.'''


name = "Masked Hero Goka - Transformation"

effect = '''You can Special Summon this card (from your hand) by banishing one "Masked Hero" from your Deck.
If a card is added to your hand (except during the Draw Phase or the Damage Step): You can add a Level 5 or higher "Hero" monster from your Deck to your hand.
You can only use these effects of "Masked Hero Goka - Transformation" once per turn.
If this card is Normal Summoned: You can Special Summon one of your level 4 or lower "Hero" monsters that is in your GY or banished.
Once per turn: You can shuffle one "Fusion", "Change", or Level 5 or higher "Hero" card from your hand to your Deck, then add one level 4 or lower "Hero" monster from your Deck to your hand.'''


name = "Masked Hero Vapor - Transformation"

effect = '''You can reveal this card in your hand: immediately after this effect resolves, Normal Summon a "Hero" monster from your hand.
If this card is Normal or Special Summoned: you can add one "Fusion" or "Change" card that is in your GY or banished to your hand.
You can only use these effects of "Masked Hero Vapor - Transformation" once per turn.
If this card is sent to the GY: Send one "Elemental Hero", "Masked Hero", "Change", or "Fusion" card from your Deck to the GY.'''


name = "Masked Hero Divine Wind - Change!!!"

effect = '''You can Special Summon this card (from your hand) by tributing another "Hero" monster from your hand or field.
You can only use this effect of "Masked Hero Divine Wind - Change!!!" once per turn.
Once per turn, you can tribute a "Hero" monster you control: Special Summon a level 4 or lower "Elemental Hero" or "Masked Hero" from your Deck. You can only Special Summon "Elemental Hero" and "Masked Hero" monsters for the rest of the turn after you activate this effect.'''


(Optional Buff, download projectoptional.zip to use this version):
Once per turn, you can tribute a "Hero" monster you control: Special Summon a level 4 or lower "Elemental Hero" or "Masked Hero" from your Deck, then Special Summon one "Elemental Hero" monster with a different name from your Deck or GY. You can only Special Summon "Elemental Hero" and "Masked Hero" monsters for the rest of the turn after you activate this effect.'''


name = "Masked Hero Koga - Change!!!"

effect = '''You can Special Summon this card (from your hand) by tributing another "Hero" monster from your hand or field.
You can only use this effect of "Masked Hero Koga - Change!!!" once per turn.
Once per turn, you can set a "Fusion" or "Change" Spell/Trap card from your Deck, then add one level 7 or lower "Hero" monster from your Deck to your hand. You can only Special Summon "Elemental Hero" and "Masked Hero" monsters for the rest of the turn after you activate this effect.'''


name = "Masked Hero Dian - Change!!!"

effect = '''Once per turn, you can Special Summon a level 7 or lower "Hero" monster from your hand.
You can only use the following effects of "Masked Hero Dian - Change!!!" once per turn.
You can Special Summon this card (from your hand) by tributing another "Hero" monster from your hand or field.
If this card is sent to the GY: Add a "Fusion" or "Change" card from your Deck to the hand. You can only Special Summon "Elemental Hero" and "Masked Hero" monsters for the rest of the turn after you use this effect.'''


name = "Masked Hero Anki - Change!!!"

effect = '''Once per turn, you can send a "Hero" monster from your Extra Deck to the GY, then send a "Mask Change" from your Deck to the GY: Apply that card's effect.
You can only use the following effects of "Masked Hero Anki - Change!!!" once per turn.
You can Special Summon this card (from your hand) by tributing another "Hero" monster from your hand or field.
You can banish this card from your GY: Add one "Hero", "Fusion", or "Change" card from your GY to your hand. You can only Special Summon "Elemental Hero" and "Masked Hero" monsters for the rest of the turn after you activate this effect.'''

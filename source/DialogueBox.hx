package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.text.FlxTypeText;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.input.FlxKeyManager;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

using StringTools;

class DialogueBox extends FlxSpriteGroup
{
	var box:FlxSprite;

	var curCharacter:String = '';

	var dialogue:Alphabet;
	var dialogueList:Array<String> = [];

	// SECOND DIALOGUE FOR THE PIXEL SHIT INSTEAD???
	var swagDialogue:FlxTypeText;

	var dropText:FlxText;

	public var finishThing:Void->Void;

	var portraitLeft:FlxSprite;
	var portraitLeftB:FlxSprite;
	var portraitLeftC:FlxSprite;
	var portraitLeftD:FlxSprite;
	var portraitLeftE:FlxSprite;
	var portraitLeftnull:FlxSprite;
	var portraitRight:FlxSprite;
	var portraitRightgf:FlxSprite;

	var handSelect:FlxSprite;
	var bgFade:FlxSprite;

	public function new(talkingRight:Bool = true, ?dialogueList:Array<String>)
	{
		super();

		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'senpai':
				FlxG.sound.playMusic(Paths.music('Lunchbox'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'thorns':
				FlxG.sound.playMusic(Paths.music('LunchboxScary'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
		}

		bgFade = new FlxSprite(-200, -200).makeGraphic(Std.int(FlxG.width * 1.3), Std.int(FlxG.height * 1.3), 0xFFB3DFd8);
		bgFade.scrollFactor.set();
		bgFade.alpha = 0;
		add(bgFade);

		new FlxTimer().start(0.83, function(tmr:FlxTimer)
		{
			bgFade.alpha += (1 / 5) * 0.7;
			if (bgFade.alpha > 0.7)
				bgFade.alpha = 0.7;
		}, 5);

		box = new FlxSprite(-20, 45);
		
		var hasDialog = false;
		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'consequential':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-pixel');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);
			case 'dyspeptic':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-pixel');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);
	case 'non compos mentis':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-pixel');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);
		}

		this.dialogueList = dialogueList;
		
		if (!hasDialog)
			return;
		
		if(PlayState.SONG.song.toLowerCase() == 'senpai' || PlayState.SONG.song.toLowerCase() == 'roses' || PlayState.SONG.song.toLowerCase() == 'thorns')
		{	
		portraitLeft = new FlxSprite(-20, 40);
		portraitLeft.frames = Paths.getSparrowAtlas('weeb/senpaiPortrait');
		portraitLeft.animation.addByPrefix('enter', 'Senpai Portrait Enter', 24, false);
		portraitLeft.setGraphicSize(Std.int(portraitLeft.width * PlayState.daPixelZoom * 0.9));
		portraitLeft.updateHitbox();
		portraitLeft.scrollFactor.set();
		add(portraitLeft);
		portraitLeft.visible = false;

		portraitRight = new FlxSprite(0, 40);
		portraitRight.frames = Paths.getSparrowAtlas('weeb/bfPortrait');
		portraitRight.animation.addByPrefix('enter', 'Boyfriend portrait enter', 24, false);
		portraitRight.setGraphicSize(Std.int(portraitRight.width * PlayState.daPixelZoom * 0.9));
		portraitRight.updateHitbox();
		portraitRight.scrollFactor.set();
		add(portraitRight);
		portraitRight.visible = false;
		
		box.animation.play('normalOpen');
		box.setGraphicSize(Std.int(box.width * PlayState.daPixelZoom * 0.9));
		box.updateHitbox();
		add(box);

		box.screenCenter(X);
		portraitLeft.screenCenter(X);

		handSelect = new FlxSprite(FlxG.width * 0.9, FlxG.height * 0.9).loadGraphic(Paths.image('weeb/pixelUI/hand_textbox'));
		add(handSelect);
		}
		else if (PlayState.SONG.song.toLowerCase() == 'consequential' || PlayState.SONG.song.toLowerCase() == 'dyspeptic' || PlayState.SONG.song.toLowerCase() == 'non compos mentis')
		{
		portraitLeft = new FlxSprite(80, 150);
		portraitLeft.frames = Paths.getSparrowAtlas('portraits/coralieportraits', 'shared');
		portraitLeft.animation.addByPrefix('enter', 'coralieportraitA', 24, false);
		portraitLeft.setGraphicSize(Std.int(portraitLeft.width * PlayState.daPixelZoom * 0.05));
		portraitLeft.updateHitbox();
		portraitLeft.scrollFactor.set();
		add(portraitLeft);
		portraitLeft.visible = false;

		portraitLeftB = new FlxSprite(80, 150);
		portraitLeftB.frames = Paths.getSparrowAtlas('portraits/coralieportraits', 'shared');
		portraitLeftB.animation.addByPrefix('enter', 'coralieportraitB', 24, false);
		portraitLeftB.setGraphicSize(Std.int(portraitLeftB.width * PlayState.daPixelZoom * 0.05));
		portraitLeftB.updateHitbox();
		portraitLeftB.scrollFactor.set();
		add(portraitLeftB);
		portraitLeftB.visible = false;

		portraitLeftC = new FlxSprite(80, 150);
		portraitLeftC.frames = Paths.getSparrowAtlas('portraits/coralieportraits', 'shared');
		portraitLeftC.animation.addByPrefix('enter', 'coralieportraitC', 24, false);
		portraitLeftC.setGraphicSize(Std.int(portraitLeftC.width * PlayState.daPixelZoom * 0.05));
		portraitLeftC.updateHitbox();
		portraitLeftC.scrollFactor.set();
		add(portraitLeftC);
		portraitLeftC.visible = false;

		portraitLeftD = new FlxSprite(80, 150);
		portraitLeftD.frames = Paths.getSparrowAtlas('portraits/coralieportraits', 'shared');
		portraitLeftD.animation.addByPrefix('enter', 'coralieportraitD', 24, false);
		portraitLeftD.setGraphicSize(Std.int(portraitLeftD.width * PlayState.daPixelZoom * 0.05));
		portraitLeftD.updateHitbox();
		portraitLeftD.scrollFactor.set();
		add(portraitLeftD);
		portraitLeftD.visible = false;

		portraitLeftE = new FlxSprite(80, 150);
		portraitLeftE.frames = Paths.getSparrowAtlas('portraits/coralieportraits', 'shared');
		portraitLeftE.animation.addByPrefix('enter', 'coralieportraitE', 24, false);
		portraitLeftE.setGraphicSize(Std.int(portraitLeftE.width * PlayState.daPixelZoom * 0.05));
		portraitLeftE.updateHitbox();
		portraitLeftE.scrollFactor.set();
		add(portraitLeftE);
		portraitLeftE.visible = false;

		portraitLeftnull = new FlxSprite(80, 150);
		portraitLeftnull.frames = Paths.getSparrowAtlas('portraits/coralieportraits', 'shared');
		portraitLeftnull.animation.addByPrefix('enter', '??portrait', 24, false);
		portraitLeftnull.setGraphicSize(Std.int(portraitLeftnull.width * PlayState.daPixelZoom * 0.05));
		portraitLeftnull.updateHitbox();
		portraitLeftnull.scrollFactor.set();
		add(portraitLeftnull);
		portraitLeftnull.visible = false;

		portraitRight = new FlxSprite(700, 200);
		portraitRight.frames = Paths.getSparrowAtlas('portraits/BF_Dialogue', 'shared');
		portraitRight.animation.addByPrefix('enter', 'BF_Dialogue_A', 24, false);
		portraitRight.setGraphicSize(Std.int(portraitRight.width * PlayState.daPixelZoom * 0.15));
		portraitRight.updateHitbox();
		portraitRight.scrollFactor.set();
		add(portraitRight);
		portraitRight.visible = false;

		portraitRightgf = new FlxSprite(700, 170);
		portraitRightgf.frames = Paths.getSparrowAtlas('portraits/gfPortrait', 'shared');
		portraitRightgf.animation.addByPrefix('enter', 'gfportrait', 24, false);
		portraitRightgf.setGraphicSize(Std.int(portraitRightgf.width * PlayState.daPixelZoom * 0.15));
		portraitRightgf.updateHitbox();
		portraitRightgf.scrollFactor.set();
		add(portraitRightgf);
		portraitRightgf.visible = false;
		
		box.animation.play('normalOpen');
		box.setGraphicSize(Std.int(box.width * PlayState.daPixelZoom * 0.9));
		box.updateHitbox();
		add(box);

		box.screenCenter(X);

		handSelect = new FlxSprite(FlxG.width * 0.9, FlxG.height * 0.9).loadGraphic(Paths.image('weeb/pixelUI/hand_textbox'));
		add(handSelect);
		}


		if (!talkingRight)
		{
			// box.flipX = true;
		}

		dropText = new FlxText(242, 502, Std.int(FlxG.width * 0.6), "", 40);
		dropText.font = 'Bubblegum Sans';
		dropText.color = 0x000000;
		add(dropText);

		swagDialogue = new FlxTypeText(240, 500, Std.int(FlxG.width * 0.6), "", 40);
		swagDialogue.font = 'Bubblegum Sans';
		swagDialogue.color = 0xffffff;
		swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0.6)];
		add(swagDialogue);

		dialogue = new Alphabet(0, 80, "", false, true);
		// dialogue.x = 90;
		// add(dialogue);
	}

	var dialogueOpened:Bool = false;
	var dialogueStarted:Bool = false;

	override function update(elapsed:Float)
	{
		// HARD CODING CUZ IM STUPDI
		if (PlayState.SONG.song.toLowerCase() == 'roses')
			portraitLeft.visible = false;
		if (PlayState.SONG.song.toLowerCase() == 'thorns')
		{
			portraitLeft.color = FlxColor.BLACK;
			swagDialogue.color = FlxColor.WHITE;
			dropText.color = FlxColor.BLACK;
		}

		dropText.text = swagDialogue.text;

		if (box.animation.curAnim != null)
		{
			if (box.animation.curAnim.name == 'normalOpen' && box.animation.curAnim.finished)
			{
				box.animation.play('normal');
				dialogueOpened = true;
			}
		}

		if (dialogueOpened && !dialogueStarted)
		{
			startDialogue();
			dialogueStarted = true;
		}

		if (FlxG.keys.justPressed.ANY  && dialogueStarted == true)
		{
			remove(dialogue);
				
			FlxG.sound.play(Paths.sound('clickText'), 0.8);

			if (dialogueList[1] == null && dialogueList[0] != null)
			{
				if (!isEnding)
				{
					isEnding = true;

					if (PlayState.SONG.song.toLowerCase() == 'senpai' || PlayState.SONG.song.toLowerCase() == 'thorns' || PlayState.SONG.song.toLowerCase() == 'consequential' || PlayState.SONG.song.toLowerCase() == 'dyspeptic' || PlayState.SONG.song.toLowerCase() == 'non compos mentis')
						FlxG.sound.music.fadeOut(2.2, 0);

					new FlxTimer().start(0.2, function(tmr:FlxTimer)
					{
						box.alpha -= 1 / 5;
						bgFade.alpha -= 1 / 5 * 0.7;
						portraitLeft.visible = false;
						portraitLeftB.visible = false;
						portraitLeftC.visible = false;
						portraitRight.visible = false;
						swagDialogue.alpha -= 1 / 5;
						dropText.alpha = swagDialogue.alpha;
					}, 5);

					new FlxTimer().start(1.2, function(tmr:FlxTimer)
					{
						finishThing();
						kill();
					});
				}
			}
			else
			{
				dialogueList.remove(dialogueList[0]);
				startDialogue();
			}
		}
		
		super.update(elapsed);
	}

	var isEnding:Bool = false;

	function startDialogue():Void
	{
		cleanDialog();
		// var theDialog:Alphabet = new Alphabet(0, 70, dialogueList[0], false, true);
		// dialogue = theDialog;
		// add(theDialog);

		// swagDialogue.text = ;
		swagDialogue.resetText(dialogueList[0]);
		swagDialogue.start(0.04, true);

		switch (curCharacter)
		{
			case 'dad':
				portraitRight.visible = false;
				portraitLeftB.visible = false;
				portraitLeftC.visible = false;
				portraitLeftD.visible = false;
				portraitLeftE.visible = false;
				portraitLeftnull.visible = false;
				portraitRightgf.visible = false;
				if (!portraitLeft.visible)
				{
					portraitLeft.visible = true;
					portraitLeft.animation.play('enter');
				}

			case 'dadB':
				portraitRight.visible = false;
				portraitLeft.visible = false;
				portraitLeftC.visible = false;
				portraitLeftD.visible = false;
				portraitLeftE.visible = false;
				portraitLeftnull.visible = false;
				portraitRightgf.visible = false;
				if (!portraitLeftB.visible)
				{
					portraitLeftB.visible = true;
					portraitLeftB.animation.play('enter');
				}

			case 'dadC':
				portraitRight.visible = false;
				portraitLeft.visible = false;
				portraitLeftB.visible = false;
				portraitLeftD.visible = false;
				portraitLeftE.visible = false;
				portraitLeftnull.visible = false;
				portraitRightgf.visible = false;
				if (!portraitLeftC.visible)
				{
					portraitLeftC.visible = true;
					portraitLeftC.animation.play('enter');
				}

			case 'dadD':
				portraitRight.visible = false;
				portraitLeft.visible = false;
				portraitLeftB.visible = false;
				portraitLeftC.visible = false;
				portraitLeftE.visible = false;
				portraitLeftnull.visible = false;
				portraitRightgf.visible = false;
				if (!portraitLeftD.visible)
				{
					portraitLeftD.visible = true;
					portraitLeftD.animation.play('enter');
				}
			case 'dadE':
				portraitRight.visible = false;
				portraitLeft.visible = false;
				portraitLeftB.visible = false;
				portraitLeftC.visible = false;
				portraitLeftD.visible = false;
				portraitLeftnull.visible = false;
				portraitRightgf.visible = false;
				if (!portraitLeftE.visible)
				{
					portraitLeftE.visible = true;
					portraitLeftE.animation.play('enter');
				}
			case 'dadnull':
				portraitRight.visible = false;
				portraitLeft.visible = false;
				portraitLeftB.visible = false;
				portraitLeftC.visible = false;
				portraitLeftD.visible = false;
				portraitLeftE.visible = false;
				portraitLeftnull.visible = false;
				portraitRightgf.visible = false;
				if (!portraitLeftnull.visible)
				{
					portraitLeftnull.visible = true;
					portraitLeftnull.animation.play('enter');
				}

			case 'bf':
				portraitLeft.visible = false;
				portraitLeftB.visible = false;
				portraitLeftC.visible = false;
				portraitLeftD.visible = false;
				portraitLeftE.visible = false;
				portraitLeftnull.visible = false;
				portraitRightgf.visible = false;
				if (!portraitRight.visible)
				{
					portraitRight.visible = true;
					portraitRight.animation.play('enter');
				}
			case 'gf':
				portraitLeft.visible = false;
				portraitLeftB.visible = false;
				portraitLeftC.visible = false;
				portraitLeftD.visible = false;
				portraitLeftE.visible = false;
				portraitLeftnull.visible = false;
				portraitRight.visible = false;
				if (!portraitRightgf.visible)
				{
					portraitRightgf.visible = true;
				}
		}
	}

	function cleanDialog():Void
	{
		var splitName:Array<String> = dialogueList[0].split(":");
		curCharacter = splitName[1];
		dialogueList[0] = dialogueList[0].substr(splitName[1].length + 2).trim();
	}
}

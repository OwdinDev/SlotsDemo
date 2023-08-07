using Godot;
using System;

public partial class SlotMachine : Control
{

	private RandomNumberGenerator rng;
	private TextureRect[] slotTextures = new TextureRect[5];
	private Texture[] slotSymbolTextures;


	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		// Get the TextureRect nodes by getting there names
		slotTextures[0] = GetNode<TextureRect>("Slot1");
		slotTextures[1] = GetNode<TextureRect>("Slot2");
		slotTextures[2] = GetNode<TextureRect>("Slot3");
		slotTextures[3] = GetNode<TextureRect>("Slot4");
		slotTextures[4] = GetNode<TextureRect>("Slot5");

		loadTextures();
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
}

using Godot;
using System;


public partial class slot_Scene : Control
{

	private RandomNumberGenerator rng;
	private Label randomNumberLabel;


	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		rng = new RandomNumberGenerator();
		rng.Randomize();

		// Access the Label node by its uniqu name
		randomNumberLabel = GetNode<Label>("RandomNumberLabel");

		// Update the Label with the random number
		GenerateRandomNumberAndDisplay();
	}

	private void GenerateRandomNumberAndDisplay()
	{
		int randomInt = rng.RandiRange(1, 100);

		// Set the Label's text to the generated random number
		randomNumberLabel.Text = "Random Number: " + randomInt;
	}
}

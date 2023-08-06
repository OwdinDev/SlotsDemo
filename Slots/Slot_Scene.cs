using Godot;
using System;

public Label _label;

public partial class Slot_Scene : Control
{
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		_Label = GetNode<Label>("Label");
		//GD.Randi() % 50;
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		if(Input.IsActionJustPressed("ui_accept")) {
			Label(Text("12"));
		}
	}
}

using Godot;
using System;
[GlobalClass]
public partial class Plugin : Node
{
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
	}
	public static void tes()
	{
		GD.Print("tesss");
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
}

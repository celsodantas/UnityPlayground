using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraRenderToTexture : MonoBehaviour {

	private Camera cam = null;
	private RenderTexture texture = null;

	// // Use this for initialization
	void Start () {
		GameObject obj = GameObject.Find("PortalView");
        cam = obj.GetComponent<Camera>();

		texture = new RenderTexture(256, 256, 16);
        texture.antiAliasing = 1;
		texture.name = "CameraView" + GetInstanceID();
        
		cam.targetTexture = texture;
	}

	// Update is called once per frame
	void Update () {
        cam.Render();
        
        Renderer rend = GetComponent<Renderer>();
        rend.material.SetTexture("_Texture", texture);
	}
}

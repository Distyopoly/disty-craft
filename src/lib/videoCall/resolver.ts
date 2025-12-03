import { JitsiJAASStrategy } from "./implementations/jitsi-jaas/jitsiJAAS";
import { VideoCallStrategy } from "./strategy";


// here we can not use envin objects (because resolver will be used to import impl. schemas)
export function resolveVideoStrategy(): VideoCallStrategy {
      switch (process.env.NEXT_PUBLIC_VIDEOCALL_INTEGRATION_TYPE) {
    case "jitsi-jaas":
      return new JitsiJAASStrategy;
    default:
      throw new Error("Unknown integration type");
  }
}

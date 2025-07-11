import type { TurboModule } from 'react-native';
import { TurboModuleRegistry } from 'react-native';

export interface Spec extends TurboModule {
  shareUrl(url: string): void;
}

export default TurboModuleRegistry.getEnforcing<Spec>('RnShareUrl');

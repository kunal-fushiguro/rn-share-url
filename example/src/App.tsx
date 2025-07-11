import { Text, View, StyleSheet, Pressable } from 'react-native';
import { shareUrl } from 'rn-share-url';

// const result = multiply(3, 7);

export default function App() {
  return (
    <View style={styles.container}>
      <Pressable
        onPress={() => {
          shareUrl('https://reeltor.com');
        }}
      >
        <Text style={styles.text}>Share URL</Text>
      </Pressable>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  text: {
    color: 'blue',
    fontSize: 20,
  },
});

; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [339 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [672 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 256
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 293
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 38948123, ; 6: ar\Microsoft.Maui.Controls.resources.dll => 0x2524d1b => 301
	i32 39485524, ; 7: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42244203, ; 8: he\Microsoft.Maui.Controls.resources.dll => 0x284986b => 310
	i32 42639949, ; 9: System.Threading.Thread => 0x28aa24d => 145
	i32 66541672, ; 10: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 11: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 334
	i32 68219467, ; 12: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 13: Microsoft.Maui.Graphics.dll => 0x44bb714 => 194
	i32 82292897, ; 14: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 83839681, ; 15: ms\Microsoft.Maui.Controls.resources.dll => 0x4ff4ac1 => 318
	i32 98325684, ; 16: Microsoft.Extensions.Diagnostics.Abstractions => 0x5dc54b4 => 181
	i32 101534019, ; 17: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 275
	i32 117431740, ; 18: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 19: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 275
	i32 122350210, ; 20: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 21: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 297
	i32 136584136, ; 22: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0x8241bc8 => 333
	i32 140062828, ; 23: sk\Microsoft.Maui.Controls.resources.dll => 0x859306c => 326
	i32 142721839, ; 24: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 25: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 26: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 27: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 230
	i32 176265551, ; 28: System.ServiceProcess => 0xa81994f => 132
	i32 182336117, ; 29: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 277
	i32 184328833, ; 30: System.ValueTuple.dll => 0xafca281 => 151
	i32 205061960, ; 31: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 32: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 228
	i32 220171995, ; 33: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 221958352, ; 34: Microsoft.Extensions.Diagnostics.dll => 0xd3ad0d0 => 180
	i32 230216969, ; 35: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 250
	i32 230752869, ; 36: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 37: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 38: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 39: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 261689757, ; 40: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 233
	i32 266337479, ; 41: Xamarin.Google.Guava.FailureAccess.dll => 0xfdffcc7 => 292
	i32 276479776, ; 42: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 43: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 252
	i32 280482487, ; 44: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 249
	i32 291076382, ; 45: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 291275502, ; 46: Microsoft.Extensions.Http.dll => 0x115c82ee => 182
	i32 293579439, ; 47: ExoPlayer.Dash.dll => 0x117faaaf => 205
	i32 298918909, ; 48: System.Net.Ping.dll => 0x11d123fd => 69
	i32 317674968, ; 49: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 331
	i32 318968648, ; 50: Xamarin.AndroidX.Activity.dll => 0x13031348 => 219
	i32 321597661, ; 51: System.Numerics => 0x132b30dd => 83
	i32 321963286, ; 52: fr\Microsoft.Maui.Controls.resources.dll => 0x1330c516 => 309
	i32 342366114, ; 53: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 251
	i32 347068432, ; 54: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0x14afd810 => 199
	i32 360082299, ; 55: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 56: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 57: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 58: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 59: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 60: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 61: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 62: _Microsoft.Android.Resource.Designer => 0x17969339 => 335
	i32 403441872, ; 63: WindowsBase => 0x180c08d0 => 165
	i32 409257351, ; 64: tr\Microsoft.Maui.Controls.resources.dll => 0x1864c587 => 329
	i32 441335492, ; 65: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 234
	i32 442565967, ; 66: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 67: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 247
	i32 451504562, ; 68: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 452127346, ; 69: ExoPlayer.Database.dll => 0x1af2ea72 => 206
	i32 456227837, ; 70: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 71: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 72: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 73: System.dll => 0x1bff388e => 164
	i32 476646585, ; 74: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 249
	i32 486930444, ; 75: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 262
	i32 489220957, ; 76: es\Microsoft.Maui.Controls.resources.dll => 0x1d28eb5d => 307
	i32 498788369, ; 77: System.ObjectModel => 0x1dbae811 => 84
	i32 513247710, ; 78: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 188
	i32 526420162, ; 79: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 80: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 297
	i32 530272170, ; 81: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 538707440, ; 82: th\Microsoft.Maui.Controls.resources.dll => 0x201c05f0 => 328
	i32 539058512, ; 83: Microsoft.Extensions.Logging => 0x20216150 => 183
	i32 540030774, ; 84: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 85: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 86: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 87: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 88: Jsr305Binding => 0x213954e7 => 288
	i32 569601784, ; 89: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 286
	i32 577335427, ; 90: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 601371474, ; 91: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 92: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 93: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 626887733, ; 94: ExoPlayer.Container => 0x255d8c35 => 203
	i32 627609679, ; 95: Xamarin.AndroidX.CustomView => 0x2568904f => 239
	i32 627931235, ; 96: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 320
	i32 639843206, ; 97: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 245
	i32 643868501, ; 98: System.Net => 0x2660a755 => 81
	i32 662205335, ; 99: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 100: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 282
	i32 666292255, ; 101: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 226
	i32 672442732, ; 102: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 103: System.Net.Security => 0x28bdabca => 73
	i32 690569205, ; 104: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 105: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 299
	i32 693804605, ; 106: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 107: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 108: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 294
	i32 700358131, ; 109: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 720511267, ; 110: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 298
	i32 722857257, ; 111: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 731701662, ; 112: Microsoft.Extensions.Options.ConfigurationExtensions => 0x2b9ce19e => 187
	i32 735137430, ; 113: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 748832960, ; 114: SQLitePCLRaw.batteries_v2 => 0x2ca248c0 => 196
	i32 752232764, ; 115: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 116: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 216
	i32 759454413, ; 117: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 118: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 119: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 120: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 326
	i32 789151979, ; 121: Microsoft.Extensions.Options => 0x2f0980eb => 186
	i32 790371945, ; 122: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 240
	i32 804715423, ; 123: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 124: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 254
	i32 812693636, ; 125: ExoPlayer.Dash => 0x3070b884 => 205
	i32 823281589, ; 126: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 127: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 128: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 129: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 130: Xamarin.AndroidX.Print => 0x3246f6cd => 268
	i32 869139383, ; 131: hi\Microsoft.Maui.Controls.resources.dll => 0x33ce03b7 => 311
	i32 873119928, ; 132: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 133: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 134: System.Net.Http.Json => 0x3463c971 => 63
	i32 880668424, ; 135: ru\Microsoft.Maui.Controls.resources.dll => 0x347def08 => 325
	i32 904024072, ; 136: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 137: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 918734561, ; 138: pt-BR\Microsoft.Maui.Controls.resources.dll => 0x36c2c6e1 => 322
	i32 928116545, ; 139: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 293
	i32 939704684, ; 140: ExoPlayer.Extractor => 0x3802c16c => 209
	i32 952186615, ; 141: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 952358589, ; 142: SQLitePCLRaw.nativelibrary => 0x38c3d6bd => 197
	i32 956575887, ; 143: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 298
	i32 961460050, ; 144: it\Microsoft.Maui.Controls.resources.dll => 0x394eb752 => 315
	i32 966729478, ; 145: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 289
	i32 967690846, ; 146: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 251
	i32 975236339, ; 147: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 148: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 149: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 150: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 990727110, ; 151: ro\Microsoft.Maui.Controls.resources.dll => 0x3b0d4bc6 => 324
	i32 992768348, ; 152: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 153: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 1001831731, ; 154: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 155: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 272
	i32 1019214401, ; 156: System.Drawing => 0x3cbffa41 => 36
	i32 1028013380, ; 157: ExoPlayer.UI.dll => 0x3d463d44 => 214
	i32 1028951442, ; 158: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 179
	i32 1031528504, ; 159: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 290
	i32 1035644815, ; 160: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 224
	i32 1036536393, ; 161: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1043950537, ; 162: de\Microsoft.Maui.Controls.resources.dll => 0x3e396bc9 => 305
	i32 1044663988, ; 163: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1048992957, ; 164: Microsoft.Extensions.Diagnostics.Abstractions.dll => 0x3e865cbd => 181
	i32 1052210849, ; 165: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 258
	i32 1067306892, ; 166: GoogleGson => 0x3f9dcf8c => 174
	i32 1082857460, ; 167: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 168: Xamarin.Kotlin.StdLib => 0x409e66d8 => 295
	i32 1098259244, ; 169: System => 0x41761b2c => 164
	i32 1108272742, ; 170: sv\Microsoft.Maui.Controls.resources.dll => 0x420ee666 => 327
	i32 1117529484, ; 171: pl\Microsoft.Maui.Controls.resources.dll => 0x429c258c => 321
	i32 1118262833, ; 172: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 317
	i32 1121599056, ; 173: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 257
	i32 1127624469, ; 174: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 185
	i32 1149092582, ; 175: Xamarin.AndroidX.Window => 0x447dc2e6 => 285
	i32 1151313727, ; 176: ExoPlayer.Rtsp => 0x449fa73f => 211
	i32 1168523401, ; 177: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 323
	i32 1170634674, ; 178: System.Web.dll => 0x45c677b2 => 153
	i32 1175144683, ; 179: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 281
	i32 1178241025, ; 180: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 266
	i32 1204270330, ; 181: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 226
	i32 1208641965, ; 182: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1219128291, ; 183: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1243150071, ; 184: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 286
	i32 1253011324, ; 185: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 186: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 303
	i32 1263886435, ; 187: Xamarin.Google.Guava.dll => 0x4b556063 => 291
	i32 1264511973, ; 188: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 276
	i32 1267360935, ; 189: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 280
	i32 1273260888, ; 190: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 231
	i32 1275534314, ; 191: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 299
	i32 1278448581, ; 192: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 223
	i32 1292207520, ; 193: SQLitePCLRaw.core.dll => 0x4d0585a0 => 198
	i32 1293217323, ; 194: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 242
	i32 1308624726, ; 195: hr\Microsoft.Maui.Controls.resources.dll => 0x4e000756 => 312
	i32 1309188875, ; 196: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1309209905, ; 197: ExoPlayer.DataSource => 0x4e08f531 => 207
	i32 1322716291, ; 198: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 285
	i32 1324164729, ; 199: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 200: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1336711579, ; 201: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x4fac999b => 332
	i32 1364015309, ; 202: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 203: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 333
	i32 1376866003, ; 204: Xamarin.AndroidX.SavedState => 0x52114ed3 => 272
	i32 1379779777, ; 205: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1395857551, ; 206: Xamarin.AndroidX.Media.dll => 0x5333188f => 263
	i32 1402170036, ; 207: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 208: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 235
	i32 1406299041, ; 209: Xamarin.Google.Guava.FailureAccess => 0x53d26ba1 => 292
	i32 1408764838, ; 210: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 211: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 212: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 213: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 301
	i32 1434145427, ; 214: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 215: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 289
	i32 1439761251, ; 216: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 217: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 218: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1457743152, ; 219: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 220: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1461004990, ; 221: es\Microsoft.Maui.Controls.resources => 0x57152abe => 307
	i32 1461234159, ; 222: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 223: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 224: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 225: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 225
	i32 1470490898, ; 226: Microsoft.Extensions.Primitives => 0x57a5e912 => 188
	i32 1479771757, ; 227: System.Collections.Immutable => 0x5833866d => 9
	i32 1480156764, ; 228: ExoPlayer.DataSource.dll => 0x5839665c => 207
	i32 1480492111, ; 229: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 230: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 231: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 273
	i32 1505131794, ; 232: Microsoft.Extensions.Http => 0x59b67d12 => 182
	i32 1526286932, ; 233: vi\Microsoft.Maui.Controls.resources.dll => 0x5af94a54 => 331
	i32 1536373174, ; 234: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 235: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 236: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1550322496, ; 237: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1565862583, ; 238: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 239: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 240: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 241: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582372066, ; 242: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 241
	i32 1592978981, ; 243: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 244: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 290
	i32 1601112923, ; 245: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 246: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 247: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 248: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 261
	i32 1622358360, ; 249: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 250: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 284
	i32 1635184631, ; 251: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 245
	i32 1636350590, ; 252: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 238
	i32 1638652436, ; 253: CommunityToolkit.Maui.MediaElement => 0x61abda14 => 173
	i32 1639515021, ; 254: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 255: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 256: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1651247257, ; 257: NikolaychikLAB1.dll => 0x626c0899 => 0
	i32 1657153582, ; 258: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 259: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 278
	i32 1658251792, ; 260: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 287
	i32 1670060433, ; 261: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 233
	i32 1675553242, ; 262: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 263: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 264: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 265: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1691477237, ; 266: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 267: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 268: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 296
	i32 1700397376, ; 269: ExoPlayer.Transformer => 0x655a0140 => 213
	i32 1701541528, ; 270: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1711441057, ; 271: SQLitePCLRaw.lib.e_sqlite3.android => 0x660284a1 => 199
	i32 1720223769, ; 272: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 254
	i32 1726116996, ; 273: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 274: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 275: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 229
	i32 1743415430, ; 276: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 302
	i32 1744735666, ; 277: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746316138, ; 278: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 279: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 280: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1763938596, ; 281: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765620304, ; 282: ExoPlayer.Core => 0x693d3a50 => 204
	i32 1765942094, ; 283: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 284: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 277
	i32 1770582343, ; 285: Microsoft.Extensions.Logging.dll => 0x6988f147 => 183
	i32 1776026572, ; 286: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 287: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 288: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 289: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 318
	i32 1788241197, ; 290: Xamarin.AndroidX.Fragment => 0x6a96652d => 247
	i32 1793755602, ; 291: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 310
	i32 1808609942, ; 292: Xamarin.AndroidX.Loader => 0x6bcd3296 => 261
	i32 1813058853, ; 293: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 295
	i32 1813201214, ; 294: Xamarin.Google.Android.Material => 0x6c13413e => 287
	i32 1818569960, ; 295: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 267
	i32 1818787751, ; 296: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 297: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 298: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 299: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 184
	i32 1847515442, ; 300: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 216
	i32 1853025655, ; 301: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 327
	i32 1858542181, ; 302: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 303: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1875935024, ; 304: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 309
	i32 1879696579, ; 305: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 306: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 227
	i32 1888955245, ; 307: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 308: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1893218855, ; 309: cs\Microsoft.Maui.Controls.resources.dll => 0x70d83a27 => 303
	i32 1898237753, ; 310: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 311: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 312: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1926145099, ; 313: ExoPlayer.Container.dll => 0x72cea44b => 203
	i32 1939592360, ; 314: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1953182387, ; 315: id\Microsoft.Maui.Controls.resources.dll => 0x746b32b3 => 314
	i32 1956758971, ; 316: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 317: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 274
	i32 1968388702, ; 318: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 175
	i32 1983156543, ; 319: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 296
	i32 1985761444, ; 320: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 218
	i32 2003115576, ; 321: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 306
	i32 2011961780, ; 322: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 323: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 258
	i32 2031763787, ; 324: Xamarin.Android.Glide => 0x791a414b => 215
	i32 2045470958, ; 325: System.Private.Xml => 0x79eb68ee => 88
	i32 2048278909, ; 326: Microsoft.Extensions.Configuration.Binder.dll => 0x7a16417d => 177
	i32 2055257422, ; 327: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 253
	i32 2060060697, ; 328: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 329: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 305
	i32 2070888862, ; 330: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2079903147, ; 331: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 332: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2103459038, ; 333: SQLitePCLRaw.provider.e_sqlite3.dll => 0x7d603cde => 200
	i32 2106312818, ; 334: ExoPlayer.Decoder => 0x7d8bc872 => 208
	i32 2113912252, ; 335: ExoPlayer.UI => 0x7dffbdbc => 214
	i32 2127167465, ; 336: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 337: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 338: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 339: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 340: Microsoft.Maui => 0x80bd55ad => 192
	i32 2169148018, ; 341: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 313
	i32 2181898931, ; 342: Microsoft.Extensions.Options.dll => 0x820d22b3 => 186
	i32 2192057212, ; 343: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 184
	i32 2193016926, ; 344: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2201107256, ; 345: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 300
	i32 2201231467, ; 346: System.Net.Http => 0x8334206b => 64
	i32 2202964214, ; 347: ExoPlayer.dll => 0x834e90f6 => 201
	i32 2207618523, ; 348: it\Microsoft.Maui.Controls.resources => 0x839595db => 315
	i32 2217644978, ; 349: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 281
	i32 2222056684, ; 350: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2239138732, ; 351: ExoPlayer.SmoothStreaming => 0x85768bac => 212
	i32 2244775296, ; 352: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 262
	i32 2252106437, ; 353: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2256313426, ; 354: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 355: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 356: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 176
	i32 2267999099, ; 357: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 217
	i32 2279755925, ; 358: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 270
	i32 2293034957, ; 359: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 360: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 361: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 362: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 319
	i32 2305521784, ; 363: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 364: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 221
	i32 2320631194, ; 365: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2340441535, ; 366: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 367: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 368: System.Net.Primitives => 0x8c40e0db => 70
	i32 2366048013, ; 369: hu\Microsoft.Maui.Controls.resources.dll => 0x8d07070d => 313
	i32 2368005991, ; 370: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2371007202, ; 371: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 175
	i32 2378619854, ; 372: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 373: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 374: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 314
	i32 2401565422, ; 375: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 376: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 244
	i32 2421380589, ; 377: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 378: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 231
	i32 2427813419, ; 379: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 311
	i32 2435356389, ; 380: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 381: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2437192331, ; 382: CommunityToolkit.Maui.MediaElement.dll => 0x91449a8b => 173
	i32 2454642406, ; 383: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 384: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 385: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465273461, ; 386: SQLitePCLRaw.batteries_v2.dll => 0x92f11675 => 196
	i32 2465532216, ; 387: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 234
	i32 2471841756, ; 388: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 389: Java.Interop.dll => 0x93918882 => 168
	i32 2476233210, ; 390: ExoPlayer => 0x939851fa => 201
	i32 2480646305, ; 391: Microsoft.Maui.Controls => 0x93dba8a1 => 190
	i32 2483903535, ; 392: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 393: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 394: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 395: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2503351294, ; 396: ko\Microsoft.Maui.Controls.resources.dll => 0x95361bfe => 317
	i32 2505896520, ; 397: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 256
	i32 2515854816, ; 398: ExoPlayer.Common => 0x95f4e5e0 => 202
	i32 2522472828, ; 399: Xamarin.Android.Glide.dll => 0x9659e17c => 215
	i32 2538310050, ; 400: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2550873716, ; 401: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 312
	i32 2562349572, ; 402: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 403: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2576534780, ; 404: ja\Microsoft.Maui.Controls.resources.dll => 0x9992ccfc => 316
	i32 2581783588, ; 405: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 257
	i32 2581819634, ; 406: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 280
	i32 2585220780, ; 407: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 408: System.Net.Ping => 0x9a20430d => 69
	i32 2589602615, ; 409: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2593496499, ; 410: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 321
	i32 2605712449, ; 411: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 300
	i32 2615233544, ; 412: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 248
	i32 2616218305, ; 413: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 185
	i32 2617129537, ; 414: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 415: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 416: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 238
	i32 2624644809, ; 417: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 243
	i32 2626028643, ; 418: ExoPlayer.Rtsp.dll => 0x9c860463 => 211
	i32 2626831493, ; 419: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 316
	i32 2627185994, ; 420: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 421: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 422: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 252
	i32 2663391936, ; 423: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 217
	i32 2663698177, ; 424: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 425: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 426: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 427: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 428: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2693849962, ; 429: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 430: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 278
	i32 2713040075, ; 431: ExoPlayer.Hls => 0xa1b5b4cb => 210
	i32 2715334215, ; 432: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 433: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 434: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 435: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 436: Xamarin.AndroidX.Activity => 0xa2e0939b => 219
	i32 2735172069, ; 437: System.Threading.Channels => 0xa30769e5 => 139
	i32 2737747696, ; 438: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 225
	i32 2740698338, ; 439: ca\Microsoft.Maui.Controls.resources.dll => 0xa35bbce2 => 302
	i32 2740948882, ; 440: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 441: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 442: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 322
	i32 2754540824, ; 443: SQLitePCLRaw.nativelibrary.dll => 0xa42ef518 => 197
	i32 2758225723, ; 444: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 191
	i32 2764765095, ; 445: Microsoft.Maui.dll => 0xa4caf7a7 => 192
	i32 2765824710, ; 446: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 447: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 294
	i32 2778768386, ; 448: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 283
	i32 2779977773, ; 449: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 271
	i32 2785988530, ; 450: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 328
	i32 2788224221, ; 451: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 248
	i32 2796087574, ; 452: ExoPlayer.Extractor.dll => 0xa6a8e916 => 209
	i32 2801831435, ; 453: Microsoft.Maui.Graphics => 0xa7008e0b => 194
	i32 2803228030, ; 454: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2810250172, ; 455: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 235
	i32 2819470561, ; 456: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 457: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 458: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 271
	i32 2824502124, ; 459: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2838993487, ; 460: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 259
	i32 2849599387, ; 461: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2853208004, ; 462: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 283
	i32 2855708567, ; 463: Xamarin.AndroidX.Transition => 0xaa36a797 => 279
	i32 2861098320, ; 464: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 465: Microsoft.Maui.Essentials => 0xaa8a4878 => 193
	i32 2870099610, ; 466: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 220
	i32 2875164099, ; 467: Jsr305Binding.dll => 0xab5f85c3 => 288
	i32 2875220617, ; 468: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 469: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 246
	i32 2887636118, ; 470: System.Net.dll => 0xac1dd496 => 81
	i32 2899753641, ; 471: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 472: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 473: System.Reflection => 0xacf080de => 97
	i32 2903850283, ; 474: NikolaychikLAB1 => 0xad153d2b => 0
	i32 2905242038, ; 475: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 476: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2916838712, ; 477: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 284
	i32 2919462931, ; 478: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 479: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 222
	i32 2936416060, ; 480: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 481: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 482: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2959614098, ; 483: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2960379616, ; 484: Xamarin.Google.Guava => 0xb073cee0 => 291
	i32 2968338931, ; 485: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2971004615, ; 486: Microsoft.Extensions.Options.ConfigurationExtensions.dll => 0xb115eec7 => 187
	i32 2972252294, ; 487: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 488: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 242
	i32 2987532451, ; 489: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 274
	i32 2996846495, ; 490: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 255
	i32 3016983068, ; 491: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 276
	i32 3020703001, ; 492: Microsoft.Extensions.Diagnostics => 0xb40c4519 => 180
	i32 3023353419, ; 493: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 494: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 250
	i32 3027462113, ; 495: ExoPlayer.Common.dll => 0xb47367e1 => 202
	i32 3038032645, ; 496: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 335
	i32 3053864966, ; 497: fi\Microsoft.Maui.Controls.resources.dll => 0xb6064806 => 308
	i32 3056245963, ; 498: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 273
	i32 3057625584, ; 499: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 264
	i32 3059408633, ; 500: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 501: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 502: System.Threading.Tasks => 0xb755818f => 144
	i32 3090735792, ; 503: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 504: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 505: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 506: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 507: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 508: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 509: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3144327419, ; 510: ExoPlayer.Hls.dll => 0xbb6aa0fb => 210
	i32 3147165239, ; 511: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 512: GoogleGson.dll => 0xbba64c02 => 174
	i32 3159123045, ; 513: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 514: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 515: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 265
	i32 3190271366, ; 516: ExoPlayer.Decoder.dll => 0xbe27ad86 => 208
	i32 3192346100, ; 517: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 518: System.Web => 0xbe592c0c => 153
	i32 3204380047, ; 519: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 520: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 521: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 241
	i32 3220365878, ; 522: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 523: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3251039220, ; 524: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3258312781, ; 525: Xamarin.AndroidX.CardView => 0xc235e84d => 229
	i32 3265493905, ; 526: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 527: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 528: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 529: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 530: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3286872994, ; 531: SQLite-net.dll => 0xc3e9b3a2 => 195
	i32 3290767353, ; 532: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 533: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 534: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 535: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 308
	i32 3316684772, ; 536: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 537: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 239
	i32 3317144872, ; 538: System.Data => 0xc5b79d28 => 24
	i32 3329734229, ; 539: ExoPlayer.Database => 0xc677b655 => 206
	i32 3340431453, ; 540: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 227
	i32 3345895724, ; 541: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 269
	i32 3346324047, ; 542: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 266
	i32 3357674450, ; 543: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 325
	i32 3358260929, ; 544: System.Text.Json => 0xc82afec1 => 137
	i32 3360279109, ; 545: SQLitePCLRaw.core => 0xc849ca45 => 198
	i32 3362336904, ; 546: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 220
	i32 3362522851, ; 547: Xamarin.AndroidX.Core => 0xc86c06e3 => 236
	i32 3366347497, ; 548: Java.Interop => 0xc8a662e9 => 168
	i32 3374999561, ; 549: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 270
	i32 3381016424, ; 550: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 304
	i32 3395150330, ; 551: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3396979385, ; 552: ExoPlayer.Transformer.dll => 0xca79cab9 => 213
	i32 3403906625, ; 553: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 554: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 240
	i32 3421170118, ; 555: Microsoft.Extensions.Configuration.Binder => 0xcbeae9c6 => 177
	i32 3428513518, ; 556: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 178
	i32 3429136800, ; 557: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 558: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 559: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 243
	i32 3445260447, ; 560: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 561: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 189
	i32 3458724246, ; 562: pt\Microsoft.Maui.Controls.resources.dll => 0xce27f196 => 323
	i32 3471940407, ; 563: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 564: Mono.Android => 0xcf3163e6 => 171
	i32 3484440000, ; 565: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 324
	i32 3485117614, ; 566: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 567: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 568: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 232
	i32 3509114376, ; 569: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 570: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 571: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 572: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3560100363, ; 573: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 574: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3580758918, ; 575: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 332
	i32 3592228221, ; 576: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0xd61d0d7d => 334
	i32 3597029428, ; 577: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 218
	i32 3598340787, ; 578: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 579: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 580: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 581: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 268
	i32 3633644679, ; 582: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 222
	i32 3638274909, ; 583: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 584: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 253
	i32 3643446276, ; 585: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 329
	i32 3643854240, ; 586: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 265
	i32 3645089577, ; 587: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 588: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 176
	i32 3660523487, ; 589: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 590: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3682565725, ; 591: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 228
	i32 3684561358, ; 592: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 232
	i32 3700866549, ; 593: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 594: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 237
	i32 3716563718, ; 595: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 596: Xamarin.AndroidX.Annotation => 0xdda814c6 => 221
	i32 3724971120, ; 597: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 264
	i32 3732100267, ; 598: System.Net.NameResolution => 0xde7354ab => 67
	i32 3737834244, ; 599: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 600: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 601: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3751619990, ; 602: da\Microsoft.Maui.Controls.resources.dll => 0xdf9d2d96 => 304
	i32 3754567612, ; 603: SQLitePCLRaw.provider.e_sqlite3 => 0xdfca27bc => 200
	i32 3786282454, ; 604: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 230
	i32 3792276235, ; 605: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 606: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 189
	i32 3802395368, ; 607: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3819260425, ; 608: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3822602673, ; 609: Xamarin.AndroidX.Media => 0xe3d849b1 => 263
	i32 3823082795, ; 610: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 611: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 612: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 179
	i32 3844307129, ; 613: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 614: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 615: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 616: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 617: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3876362041, ; 618: SQLite-net => 0xe70c9739 => 195
	i32 3885497537, ; 619: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 620: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 279
	i32 3888767677, ; 621: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 269
	i32 3896106733, ; 622: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 623: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 236
	i32 3901907137, ; 624: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920221145, ; 625: nl\Microsoft.Maui.Controls.resources.dll => 0xe9a9d3d9 => 320
	i32 3920810846, ; 626: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 627: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 282
	i32 3928044579, ; 628: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 629: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 630: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 267
	i32 3945713374, ; 631: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 632: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 633: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 224
	i32 3959773229, ; 634: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 255
	i32 4003436829, ; 635: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 636: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 223
	i32 4025784931, ; 637: System.Memory => 0xeff49a63 => 62
	i32 4046471985, ; 638: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 191
	i32 4054681211, ; 639: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 640: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 641: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4091086043, ; 642: el\Microsoft.Maui.Controls.resources.dll => 0xf3d904db => 306
	i32 4094352644, ; 643: Microsoft.Maui.Essentials.dll => 0xf40add04 => 193
	i32 4099507663, ; 644: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 645: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 646: Xamarin.AndroidX.Emoji2 => 0xf479582c => 244
	i32 4103439459, ; 647: uk\Microsoft.Maui.Controls.resources.dll => 0xf4958463 => 330
	i32 4126470640, ; 648: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 178
	i32 4127667938, ; 649: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 650: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 651: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 652: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 330
	i32 4151237749, ; 653: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 654: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 655: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 656: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4173364138, ; 657: ExoPlayer.SmoothStreaming.dll => 0xf8c07baa => 212
	i32 4181436372, ; 658: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 659: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 260
	i32 4185676441, ; 660: System.Security => 0xf97c5a99 => 130
	i32 4190597220, ; 661: ExoPlayer.Core.dll => 0xf9c77064 => 204
	i32 4196529839, ; 662: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 663: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4249188766, ; 664: nb\Microsoft.Maui.Controls.resources.dll => 0xfd45799e => 319
	i32 4256097574, ; 665: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 237
	i32 4258378803, ; 666: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 259
	i32 4260525087, ; 667: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 668: Microsoft.Maui.Controls.dll => 0xfea12dee => 190
	i32 4274976490, ; 669: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 670: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 260
	i32 4294763496 ; 671: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 246
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [672 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 256, ; 3
	i32 293, ; 4
	i32 48, ; 5
	i32 301, ; 6
	i32 80, ; 7
	i32 310, ; 8
	i32 145, ; 9
	i32 30, ; 10
	i32 334, ; 11
	i32 124, ; 12
	i32 194, ; 13
	i32 102, ; 14
	i32 318, ; 15
	i32 181, ; 16
	i32 275, ; 17
	i32 107, ; 18
	i32 275, ; 19
	i32 139, ; 20
	i32 297, ; 21
	i32 333, ; 22
	i32 326, ; 23
	i32 77, ; 24
	i32 124, ; 25
	i32 13, ; 26
	i32 230, ; 27
	i32 132, ; 28
	i32 277, ; 29
	i32 151, ; 30
	i32 18, ; 31
	i32 228, ; 32
	i32 26, ; 33
	i32 180, ; 34
	i32 250, ; 35
	i32 1, ; 36
	i32 59, ; 37
	i32 42, ; 38
	i32 91, ; 39
	i32 233, ; 40
	i32 292, ; 41
	i32 147, ; 42
	i32 252, ; 43
	i32 249, ; 44
	i32 54, ; 45
	i32 182, ; 46
	i32 205, ; 47
	i32 69, ; 48
	i32 331, ; 49
	i32 219, ; 50
	i32 83, ; 51
	i32 309, ; 52
	i32 251, ; 53
	i32 199, ; 54
	i32 131, ; 55
	i32 55, ; 56
	i32 149, ; 57
	i32 74, ; 58
	i32 145, ; 59
	i32 62, ; 60
	i32 146, ; 61
	i32 335, ; 62
	i32 165, ; 63
	i32 329, ; 64
	i32 234, ; 65
	i32 12, ; 66
	i32 247, ; 67
	i32 125, ; 68
	i32 206, ; 69
	i32 152, ; 70
	i32 113, ; 71
	i32 166, ; 72
	i32 164, ; 73
	i32 249, ; 74
	i32 262, ; 75
	i32 307, ; 76
	i32 84, ; 77
	i32 188, ; 78
	i32 150, ; 79
	i32 297, ; 80
	i32 60, ; 81
	i32 328, ; 82
	i32 183, ; 83
	i32 51, ; 84
	i32 103, ; 85
	i32 114, ; 86
	i32 40, ; 87
	i32 288, ; 88
	i32 286, ; 89
	i32 120, ; 90
	i32 52, ; 91
	i32 44, ; 92
	i32 119, ; 93
	i32 203, ; 94
	i32 239, ; 95
	i32 320, ; 96
	i32 245, ; 97
	i32 81, ; 98
	i32 136, ; 99
	i32 282, ; 100
	i32 226, ; 101
	i32 8, ; 102
	i32 73, ; 103
	i32 155, ; 104
	i32 299, ; 105
	i32 154, ; 106
	i32 92, ; 107
	i32 294, ; 108
	i32 45, ; 109
	i32 298, ; 110
	i32 109, ; 111
	i32 187, ; 112
	i32 129, ; 113
	i32 196, ; 114
	i32 25, ; 115
	i32 216, ; 116
	i32 72, ; 117
	i32 55, ; 118
	i32 46, ; 119
	i32 326, ; 120
	i32 186, ; 121
	i32 240, ; 122
	i32 22, ; 123
	i32 254, ; 124
	i32 205, ; 125
	i32 86, ; 126
	i32 43, ; 127
	i32 160, ; 128
	i32 71, ; 129
	i32 268, ; 130
	i32 311, ; 131
	i32 3, ; 132
	i32 42, ; 133
	i32 63, ; 134
	i32 325, ; 135
	i32 16, ; 136
	i32 53, ; 137
	i32 322, ; 138
	i32 293, ; 139
	i32 209, ; 140
	i32 105, ; 141
	i32 197, ; 142
	i32 298, ; 143
	i32 315, ; 144
	i32 289, ; 145
	i32 251, ; 146
	i32 34, ; 147
	i32 158, ; 148
	i32 85, ; 149
	i32 32, ; 150
	i32 324, ; 151
	i32 12, ; 152
	i32 51, ; 153
	i32 56, ; 154
	i32 272, ; 155
	i32 36, ; 156
	i32 214, ; 157
	i32 179, ; 158
	i32 290, ; 159
	i32 224, ; 160
	i32 35, ; 161
	i32 305, ; 162
	i32 58, ; 163
	i32 181, ; 164
	i32 258, ; 165
	i32 174, ; 166
	i32 17, ; 167
	i32 295, ; 168
	i32 164, ; 169
	i32 327, ; 170
	i32 321, ; 171
	i32 317, ; 172
	i32 257, ; 173
	i32 185, ; 174
	i32 285, ; 175
	i32 211, ; 176
	i32 323, ; 177
	i32 153, ; 178
	i32 281, ; 179
	i32 266, ; 180
	i32 226, ; 181
	i32 29, ; 182
	i32 52, ; 183
	i32 286, ; 184
	i32 5, ; 185
	i32 303, ; 186
	i32 291, ; 187
	i32 276, ; 188
	i32 280, ; 189
	i32 231, ; 190
	i32 299, ; 191
	i32 223, ; 192
	i32 198, ; 193
	i32 242, ; 194
	i32 312, ; 195
	i32 85, ; 196
	i32 207, ; 197
	i32 285, ; 198
	i32 61, ; 199
	i32 112, ; 200
	i32 332, ; 201
	i32 57, ; 202
	i32 333, ; 203
	i32 272, ; 204
	i32 99, ; 205
	i32 263, ; 206
	i32 19, ; 207
	i32 235, ; 208
	i32 292, ; 209
	i32 111, ; 210
	i32 101, ; 211
	i32 102, ; 212
	i32 301, ; 213
	i32 104, ; 214
	i32 289, ; 215
	i32 71, ; 216
	i32 38, ; 217
	i32 32, ; 218
	i32 103, ; 219
	i32 73, ; 220
	i32 307, ; 221
	i32 9, ; 222
	i32 123, ; 223
	i32 46, ; 224
	i32 225, ; 225
	i32 188, ; 226
	i32 9, ; 227
	i32 207, ; 228
	i32 43, ; 229
	i32 4, ; 230
	i32 273, ; 231
	i32 182, ; 232
	i32 331, ; 233
	i32 31, ; 234
	i32 138, ; 235
	i32 92, ; 236
	i32 93, ; 237
	i32 49, ; 238
	i32 141, ; 239
	i32 112, ; 240
	i32 140, ; 241
	i32 241, ; 242
	i32 115, ; 243
	i32 290, ; 244
	i32 157, ; 245
	i32 76, ; 246
	i32 79, ; 247
	i32 261, ; 248
	i32 37, ; 249
	i32 284, ; 250
	i32 245, ; 251
	i32 238, ; 252
	i32 173, ; 253
	i32 64, ; 254
	i32 138, ; 255
	i32 15, ; 256
	i32 0, ; 257
	i32 116, ; 258
	i32 278, ; 259
	i32 287, ; 260
	i32 233, ; 261
	i32 48, ; 262
	i32 70, ; 263
	i32 80, ; 264
	i32 126, ; 265
	i32 94, ; 266
	i32 121, ; 267
	i32 296, ; 268
	i32 213, ; 269
	i32 26, ; 270
	i32 199, ; 271
	i32 254, ; 272
	i32 97, ; 273
	i32 28, ; 274
	i32 229, ; 275
	i32 302, ; 276
	i32 149, ; 277
	i32 169, ; 278
	i32 4, ; 279
	i32 98, ; 280
	i32 33, ; 281
	i32 204, ; 282
	i32 93, ; 283
	i32 277, ; 284
	i32 183, ; 285
	i32 21, ; 286
	i32 41, ; 287
	i32 170, ; 288
	i32 318, ; 289
	i32 247, ; 290
	i32 310, ; 291
	i32 261, ; 292
	i32 295, ; 293
	i32 287, ; 294
	i32 267, ; 295
	i32 2, ; 296
	i32 134, ; 297
	i32 111, ; 298
	i32 184, ; 299
	i32 216, ; 300
	i32 327, ; 301
	i32 58, ; 302
	i32 95, ; 303
	i32 309, ; 304
	i32 39, ; 305
	i32 227, ; 306
	i32 25, ; 307
	i32 94, ; 308
	i32 303, ; 309
	i32 89, ; 310
	i32 99, ; 311
	i32 10, ; 312
	i32 203, ; 313
	i32 87, ; 314
	i32 314, ; 315
	i32 100, ; 316
	i32 274, ; 317
	i32 175, ; 318
	i32 296, ; 319
	i32 218, ; 320
	i32 306, ; 321
	i32 7, ; 322
	i32 258, ; 323
	i32 215, ; 324
	i32 88, ; 325
	i32 177, ; 326
	i32 253, ; 327
	i32 154, ; 328
	i32 305, ; 329
	i32 33, ; 330
	i32 116, ; 331
	i32 82, ; 332
	i32 200, ; 333
	i32 208, ; 334
	i32 214, ; 335
	i32 20, ; 336
	i32 11, ; 337
	i32 162, ; 338
	i32 3, ; 339
	i32 192, ; 340
	i32 313, ; 341
	i32 186, ; 342
	i32 184, ; 343
	i32 84, ; 344
	i32 300, ; 345
	i32 64, ; 346
	i32 201, ; 347
	i32 315, ; 348
	i32 281, ; 349
	i32 143, ; 350
	i32 212, ; 351
	i32 262, ; 352
	i32 157, ; 353
	i32 41, ; 354
	i32 117, ; 355
	i32 176, ; 356
	i32 217, ; 357
	i32 270, ; 358
	i32 131, ; 359
	i32 75, ; 360
	i32 66, ; 361
	i32 319, ; 362
	i32 172, ; 363
	i32 221, ; 364
	i32 143, ; 365
	i32 106, ; 366
	i32 151, ; 367
	i32 70, ; 368
	i32 313, ; 369
	i32 156, ; 370
	i32 175, ; 371
	i32 121, ; 372
	i32 127, ; 373
	i32 314, ; 374
	i32 152, ; 375
	i32 244, ; 376
	i32 141, ; 377
	i32 231, ; 378
	i32 311, ; 379
	i32 20, ; 380
	i32 14, ; 381
	i32 173, ; 382
	i32 135, ; 383
	i32 75, ; 384
	i32 59, ; 385
	i32 196, ; 386
	i32 234, ; 387
	i32 167, ; 388
	i32 168, ; 389
	i32 201, ; 390
	i32 190, ; 391
	i32 15, ; 392
	i32 74, ; 393
	i32 6, ; 394
	i32 23, ; 395
	i32 317, ; 396
	i32 256, ; 397
	i32 202, ; 398
	i32 215, ; 399
	i32 91, ; 400
	i32 312, ; 401
	i32 1, ; 402
	i32 136, ; 403
	i32 316, ; 404
	i32 257, ; 405
	i32 280, ; 406
	i32 134, ; 407
	i32 69, ; 408
	i32 146, ; 409
	i32 321, ; 410
	i32 300, ; 411
	i32 248, ; 412
	i32 185, ; 413
	i32 88, ; 414
	i32 96, ; 415
	i32 238, ; 416
	i32 243, ; 417
	i32 211, ; 418
	i32 316, ; 419
	i32 31, ; 420
	i32 45, ; 421
	i32 252, ; 422
	i32 217, ; 423
	i32 109, ; 424
	i32 158, ; 425
	i32 35, ; 426
	i32 22, ; 427
	i32 114, ; 428
	i32 57, ; 429
	i32 278, ; 430
	i32 210, ; 431
	i32 144, ; 432
	i32 118, ; 433
	i32 120, ; 434
	i32 110, ; 435
	i32 219, ; 436
	i32 139, ; 437
	i32 225, ; 438
	i32 302, ; 439
	i32 54, ; 440
	i32 105, ; 441
	i32 322, ; 442
	i32 197, ; 443
	i32 191, ; 444
	i32 192, ; 445
	i32 133, ; 446
	i32 294, ; 447
	i32 283, ; 448
	i32 271, ; 449
	i32 328, ; 450
	i32 248, ; 451
	i32 209, ; 452
	i32 194, ; 453
	i32 159, ; 454
	i32 235, ; 455
	i32 163, ; 456
	i32 132, ; 457
	i32 271, ; 458
	i32 161, ; 459
	i32 259, ; 460
	i32 140, ; 461
	i32 283, ; 462
	i32 279, ; 463
	i32 169, ; 464
	i32 193, ; 465
	i32 220, ; 466
	i32 288, ; 467
	i32 40, ; 468
	i32 246, ; 469
	i32 81, ; 470
	i32 56, ; 471
	i32 37, ; 472
	i32 97, ; 473
	i32 0, ; 474
	i32 166, ; 475
	i32 172, ; 476
	i32 284, ; 477
	i32 82, ; 478
	i32 222, ; 479
	i32 98, ; 480
	i32 30, ; 481
	i32 159, ; 482
	i32 18, ; 483
	i32 291, ; 484
	i32 127, ; 485
	i32 187, ; 486
	i32 119, ; 487
	i32 242, ; 488
	i32 274, ; 489
	i32 255, ; 490
	i32 276, ; 491
	i32 180, ; 492
	i32 165, ; 493
	i32 250, ; 494
	i32 202, ; 495
	i32 335, ; 496
	i32 308, ; 497
	i32 273, ; 498
	i32 264, ; 499
	i32 170, ; 500
	i32 16, ; 501
	i32 144, ; 502
	i32 125, ; 503
	i32 118, ; 504
	i32 38, ; 505
	i32 115, ; 506
	i32 47, ; 507
	i32 142, ; 508
	i32 117, ; 509
	i32 210, ; 510
	i32 34, ; 511
	i32 174, ; 512
	i32 95, ; 513
	i32 53, ; 514
	i32 265, ; 515
	i32 208, ; 516
	i32 129, ; 517
	i32 153, ; 518
	i32 24, ; 519
	i32 161, ; 520
	i32 241, ; 521
	i32 148, ; 522
	i32 104, ; 523
	i32 89, ; 524
	i32 229, ; 525
	i32 60, ; 526
	i32 142, ; 527
	i32 100, ; 528
	i32 5, ; 529
	i32 13, ; 530
	i32 195, ; 531
	i32 122, ; 532
	i32 135, ; 533
	i32 28, ; 534
	i32 308, ; 535
	i32 72, ; 536
	i32 239, ; 537
	i32 24, ; 538
	i32 206, ; 539
	i32 227, ; 540
	i32 269, ; 541
	i32 266, ; 542
	i32 325, ; 543
	i32 137, ; 544
	i32 198, ; 545
	i32 220, ; 546
	i32 236, ; 547
	i32 168, ; 548
	i32 270, ; 549
	i32 304, ; 550
	i32 101, ; 551
	i32 213, ; 552
	i32 123, ; 553
	i32 240, ; 554
	i32 177, ; 555
	i32 178, ; 556
	i32 163, ; 557
	i32 167, ; 558
	i32 243, ; 559
	i32 39, ; 560
	i32 189, ; 561
	i32 323, ; 562
	i32 17, ; 563
	i32 171, ; 564
	i32 324, ; 565
	i32 137, ; 566
	i32 150, ; 567
	i32 232, ; 568
	i32 155, ; 569
	i32 130, ; 570
	i32 19, ; 571
	i32 65, ; 572
	i32 147, ; 573
	i32 47, ; 574
	i32 332, ; 575
	i32 334, ; 576
	i32 218, ; 577
	i32 79, ; 578
	i32 61, ; 579
	i32 106, ; 580
	i32 268, ; 581
	i32 222, ; 582
	i32 49, ; 583
	i32 253, ; 584
	i32 329, ; 585
	i32 265, ; 586
	i32 14, ; 587
	i32 176, ; 588
	i32 68, ; 589
	i32 171, ; 590
	i32 228, ; 591
	i32 232, ; 592
	i32 78, ; 593
	i32 237, ; 594
	i32 108, ; 595
	i32 221, ; 596
	i32 264, ; 597
	i32 67, ; 598
	i32 63, ; 599
	i32 27, ; 600
	i32 160, ; 601
	i32 304, ; 602
	i32 200, ; 603
	i32 230, ; 604
	i32 10, ; 605
	i32 189, ; 606
	i32 11, ; 607
	i32 78, ; 608
	i32 263, ; 609
	i32 126, ; 610
	i32 83, ; 611
	i32 179, ; 612
	i32 66, ; 613
	i32 107, ; 614
	i32 65, ; 615
	i32 128, ; 616
	i32 122, ; 617
	i32 195, ; 618
	i32 77, ; 619
	i32 279, ; 620
	i32 269, ; 621
	i32 8, ; 622
	i32 236, ; 623
	i32 2, ; 624
	i32 320, ; 625
	i32 44, ; 626
	i32 282, ; 627
	i32 156, ; 628
	i32 128, ; 629
	i32 267, ; 630
	i32 23, ; 631
	i32 133, ; 632
	i32 224, ; 633
	i32 255, ; 634
	i32 29, ; 635
	i32 223, ; 636
	i32 62, ; 637
	i32 191, ; 638
	i32 90, ; 639
	i32 87, ; 640
	i32 148, ; 641
	i32 306, ; 642
	i32 193, ; 643
	i32 36, ; 644
	i32 86, ; 645
	i32 244, ; 646
	i32 330, ; 647
	i32 178, ; 648
	i32 50, ; 649
	i32 6, ; 650
	i32 90, ; 651
	i32 330, ; 652
	i32 21, ; 653
	i32 162, ; 654
	i32 96, ; 655
	i32 50, ; 656
	i32 212, ; 657
	i32 113, ; 658
	i32 260, ; 659
	i32 130, ; 660
	i32 204, ; 661
	i32 76, ; 662
	i32 27, ; 663
	i32 319, ; 664
	i32 237, ; 665
	i32 259, ; 666
	i32 7, ; 667
	i32 190, ; 668
	i32 110, ; 669
	i32 260, ; 670
	i32 246 ; 671
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ af27162bee43b7fecdca59b4f67aa8c175cbc875"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}

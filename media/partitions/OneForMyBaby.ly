
\version "2.19.80"
#(set-global-staff-size 18)
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



\paper {
  indent = 0\mm
  between-system-space = 2.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"One for my Baby"
composer = #"Harold Arlen"
meter = #"(Med. Ballad)"
kwtempo = #"Mod. Slow"
kwstyle = #"Ballad"



realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #4
          \override #'(offset . 9)
          \override #'(thickness . 6)
          \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}

\header {
  pdftitle = #title
  pdfauthor = #composer
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  subsubtitle = \markup \fontsize #4 "(and one more for the road)"
  tagline = ##f
}

\layout {
  \context {
    \Score
    startRepeatType = #"[|:"
    endRepeatType = #":|]"
    doubleRepeatType = #":|][|:"
    \override Clef #'break-visibility = #'#(#f #f #f)
    \override KeySignature #'break-visibility = #'#(#f #f #f)
    \override SystemStartBar #'collapse-height = #1
    \override ParenthesesItem.font-size = #2
  }
  \context { 
    \Staff
    printPartCombineTexts = ##f
    \consists "Merge_rests_engraver"
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
}


\layout {
  \context {
    \Score
    extraNatural = ##f
    \omit BarNumber
    skipBars = ##t
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
}

form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##t
s4 es4.:7+ bes8:m7 s2 es:7+ f4:m7 bes:7 es4.:7+ bes8:m7 s2 es4.:7+ bes8:m7 s2
es4.:7+ bes8:m7 s2 es:7+ f4:m7 bes:7 es4.:7+ bes8:m7 s2 bes:m7 es:7
as4.:7+ ges8:7+ s2 as:7+ des:13 es:7+ f:m7 g4:m7 f:m7 es2:7+
g:5+7 c:9+11+ f4:m7 g:m7 as:6 bes:9sus4 es1:6 a2:m5-7 d:7
g4.:7+ d8:m7 s2 g:7+ a4:m7 d:7 g4.:7+ d8:m7 s2 g4.:7+ d8:m7 s2
g4.:7+ d8:m7 s2 g:7+ a4:m7 d:7 g4.:7+ d8:m7 s2 s2 g:7
c4.:7+ bes8:7+ s2 c:7+ f:13 g:7+ a:m7 b4:m7 a:m7 g2:7+
b:5+7 e:9+11+ a4:m7 b:m7 c:6 d:9sus4 g1:6 d2:m7 g:7
c4.:9sus4 c8:9 s2 c:9sus4 c:9 b4:5+7 e:7 a:7 d:9sus4 g2:6 g:7 
c4.:9sus4 c8:9 s2 c4.:9sus4 c8:9 s2 a:7 es:9-11+ d1:5+7
b4:5+7 e:7 a:7 d:9sus4 d2:13sus4 d:13 g1:6 \startParenthesis \parenthesize f2:9 \endParenthesis \parenthesize  bes:13
}

theNotes =  \relative c' {
  \clef "treble" \key es \major \time 4/4
  \partial 4 fis4 \bar "||" \A
  g8 fis g f~ 4. fis8 | g fis g as bes4 as |
  g8 fis g f~ 2~ | 2.. fis8 | \break
  g8 fis g f~ 4. fis8 | g fis g as bes4 as |
  g8 fis g f~ 2~ | 2.. b8 | \break
  c b c bes~ 2 | c4 b8 bes~ bes as f4 |
  g8 as a bes~ 2~ | 2. es,8 8 | \break
  g g4 bes8 ges16( f) es4 8 | as4 g! es es |
  1 | r2 r4. ais8 \break \B \key g \major
  \repeat volta 2 {
    b8 ais b a~ 4. ais8 | b ais b c d4 c |
    b8 ais b a~ 2~ | 2.. ais8 | \break
    b8 ais b a~ 4. ais8 | b ais b c d4 c |
    b8 ais b a~ 2~ | 2.. dis8 | \break
    e dis e d~ 2 | e4 es8 d~ d c a4 |
    b8 c cis d~ 2~ | 2. g,8 g |  \break
    b8 4 d8 bes16( a) g4 8 | c4 b! g g |
  }
  \alternative {
    { 1 | \set Score.repeatCommands = #'((volta #f)) r2 r4 4 \bar "||" \break \C 
      c4. bes8 d g,4 8 | c16 bes c bes c8 bes d g, g g |
      b!16 d c4 b8 g4 g | 2.. g8 | \break
      c4. bes8 d g,4 8 | c16 bes c bes c8 bes d g,4 8 |
      a4. g8 a4. g8 | bes2.. 8 |  \break }
    { b2. g4 }
  }
  b2 fis | g1 | R1 \bar ".." }
  
verse = \lyricmode {
It's quar -- ter to three
There's no one in the place
Ex -- cept you and me
So set 'em up, Joe
I got a lit -- tle sto -- ry
you ought -- a know
We're drin -- kin' my friends
To the end
Of a brief e -- pi -- sode
Make it one for my ba -- by
And one more for the road

I got the rou -- tine
so drop a -- no -- ther nic -- kel
In the ma -- chine
I'm fee -- lin' so bad
I wish you'd make the mu -- sic
Drea -- my and sad
Could tell you a lot
But you've got to be
True to your code
Make it one for my ba -- by
And one more for the road

You'd ne -- ver know it
But bud -- dy, I'm a kind of po -- et
And I've got a lot of things to say
And when I'm gloo -- my
you sim -- ply got -- ta lis -- ten to me
un -- till it's talked a -- way. Well
}
verseB = \lyricmode {
  \repeat unfold 60 { \skip 1 }
that's how it goes
And Joe, I know you're get -- tin'
An -- xious to close
So thanks for the cheer
I hope you di -- dn't mind
My ben -- ding your ear
This torch that I've found
Got -- ta be drowned
or it soon might explode
Make it one for my ba -- by
And one more for the 
\repeat unfold 45 { \skip 1 }
road
That long, long road.
}
grille = \chordmode {
  \bar "[|:"
 
  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*7 
  s1 ^\markup \bold \box \fontsize #7 B s1*7 
  s1 ^\markup \bold \box \fontsize #7 A
}


\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "CTab")
  \header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
        >> 
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "BbTab") 
  \header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
        >> 
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "EbTab")
  \header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c a \theNotes
        >> 
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
        >> 
        \addlyrics { \verse }
        \addlyrics { \verseB }
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Bba4") 
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
        \addlyrics { \verse }
        \addlyrics { \verseB }
        >> 
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice  
          \transpose c a \theNotes
        \addlyrics { \verse }
        \addlyrics { \verseB }
        >> 
      >>
} } }
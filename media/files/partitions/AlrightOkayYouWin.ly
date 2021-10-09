
\version "2.22.0"
#(set-global-staff-size 18)
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"

\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
}

title = #"Alright, Okay, You Win"
composer = #"Mayme Watts and Sid Wyche"
meter = #"(Med. Swing)"
kwtempo = #"Medium"
kwstyle = #"Swing"

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
  asplayed = #"Peggy Lee" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=8oxS25Pga2Q"
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as sung by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

\layout {
  \context {
    \Score
    voltaSpannerDuration = #(ly:make-moment 4 4)
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
  %   \context { \RemoveEmptyStaffContext 				% ne pas imprimer les lignes vides (autres que la première)
  %              \override VerticalAxisGroup #'remove-first = ##t			% Concerne la première ligne
  %   }
}



form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##t
  s4. 
  es1*4:7 as1*2:7 es1.:7 c2:7 f1:m7 bes:7 es2:7 as:7
  es:7 bes:7  es:7 bes:7 
  es1*4:7 as1*2:7 es1:7 bes:7
  es1*4:7 as1*2:7 es1.:7 c2:7 f1:m7 bes:7 es2:7 as:7 es:7 bes:7
}


theNotes =  \relative c' {
  \clef "treble" \key es \major \time 4/4
  \partial 4. bes8 c es~ \A
  \repeat "volta" 2 { 
    es4 r r ges8 es~ | es4 r r fis8 g!~ | 
    g4 r r8 bes,8 c4 | es f8 ges~ ges b, c es~ | \break
    es4 r r f8 es~ | es4 r r c'8 bes~ | 
    bes4 r r8 g4 fis8 | g e c bes~ bes4 r8 as'~ | \break
    as g \tuplet 3/2 { as g as~ } as4 a8 bes~  | bes4 r r r8 es, |
    bes'4 as8 bes ges4 es8 es~
  }
  \alternative {
    { es4 r r8 bes c es \laissezVibrer } 
    { es4 \repeatTie r4 r2  }
  }
  \bar "||" \break \BetS r8 c'4 bes8~ bes g c, es~ | es ges r4 r2
  r8 c bes ges~ ges4 es8 es~ | es4 r r2 \pageBreak
  r8 c'4 bes8~ bes ges es4 | r8 c'4 bes8~ bes es, es es |
  ges4 es es es8 f~ | f4 r r8 bes,8 c 
  es~ 
  \bar "||" \break \C es4 r r ges8 es~ | es4 r r fis8 g!~ | 
  g4 r r8 bes,8 c4 | es f8 ges~ ges b, c es~ | \break
  es4 r r f8 es~ | es4 r r c'8 bes~ | 
  bes4 r r8 g4 fis8 | g( e) c bes~ bes4 r8 as'~ | \break
  as g \tuplet 3/2 { as g as~ } as4 a8 bes~ \toCoda| bes4 r r r8 es, |
  bes' c as8 bes ges4 es8 es~ | 
  es4 \startParenthesis \parenthesize r4 r8 bes8 c \endParenthesis \parenthesize es \laissezVibrer \bar "|."
  \DSalCoda \break
  bes'4 \repeatTie r4 r8 es4 es8~ | es c bes ges f4 es8 es~ |
  es4 r r8 es' es es~ | es4 r r es8 es~ | es4 r r es8 es~ | 
  es1 | R \bar ".."
}

verse = \lyricmode {
Well al -- right, __ o -- kay, __ you win. __
I'm in love with you.
Well al -- right, __ o -- kay, __ you win. __
Ba -- by, what can I do? __
I'll do a -- ny -- thing you say. __
It's just got to be that way. __

Well al -- right, \skip 1

All that I am as -- king,
All I want from you, __
Just love me like I love you
And it won't be hard to do. __

Well al -- right, __ o -- kay, __ you win. __
I'm in love with you.
Well al -- right, __ o -- kay, __ you win. __
Ba -- by, one thing more:
If you're gon -- na be my man, __
Sweet ba -- by, take me by the "hand._" \repeat unfold 3 { \skip 1  }
"_" Sweet ba -- by, take me by the hand. __ 
Well al -- right, __ o -- kay, __ you win. _
}

verseB = \lyricmode {
  \repeat unfold 3 { \skip 1  } o -- kay, __ you win. __
I'm in love with you.
Well al -- right, __ o -- kay, __ you win. __
Ba -- by, what can I do? __
A -- ny -- thing you say, I'll do. __
As long as it's me and "you" __ \repeat unfold 4 { \skip 1  }
}


chordsRhythm = \relative c''' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t 
}

Basse = \relative c {
  \override Rest #'staff-position = #0
  \clef "bass" \key f \major \time 4/4
}

grille = \chordmode {
  \bar "[|:"
 
  \bar ".." }

marques = \relative c' { 

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
    } \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 { "Solos blues en Mi"\flat" puis D.S. al Coda" } } } }
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
    } \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos blues en Fa puis D.S. al Coda" } } }
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
    } \markup \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos blues en Do puis D.S. al Coda" } } }
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
          \theNotes \addlyrics \verse \addlyrics \verseB
        >> 
      >>
    } \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 { "Solos blues en Mi"\flat" puis D.S. al Coda" } } } }
    %}  \bookpart {
 } }

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
          \transpose c d \theNotes \addlyrics \verse  \addlyrics \verseB
        >> 
      >>
    } \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos blues en Fa puis D.S. al Coda" } } }
    %}  \bookpart {
} }

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
          \transpose c a \theNotes \addlyrics \verse  \addlyrics \verseB
        >> 
      >>
    } \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos blues en Do puis D.S. al Coda" } } }
    %}  \bookpart {
} }

%{
convert-ly (GNU LilyPond) 2.22.1  convert-ly: Traitement de «  »...
Conversion en cours : 2.20.0, 2.21.0, 2.21.2, 2.22.0
%}
